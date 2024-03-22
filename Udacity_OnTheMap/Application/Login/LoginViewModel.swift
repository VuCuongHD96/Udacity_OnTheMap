//
//  LoginViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import Combine

struct LoginViewModel {
    
    let useCase: UserUseCaseType
}

extension LoginViewModel: ViewModel {
    
    class Input: ObservableObject {
        @Published var emailValue = ""
        @Published var passwordValue = ""
        var loginAction = PassthroughSubject<Void, Never>()
    }
    
    class Output {
        @Published var loginIsValid = false
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        let userIsValid = input.$emailValue
            .removeDuplicates()
            .map { email in
                email.contains("@")
            }
        let passwordIsValid = input.$passwordValue
            .removeDuplicates()
            .map { password in
                password.count > 7
            }
        Publishers.CombineLatest(userIsValid, passwordIsValid)
            .map {
                $0 && $1
            }
            .assign(to: \.loginIsValid, on: output)
            .store(in: cancelBag)
        
        Publishers.CombineLatest4(input.loginAction, 
                                  output.$loginIsValid,
                                  input.$emailValue,
                                  input.$passwordValue)
            .filter { _, loginIsValid, _, _ in
                return loginIsValid
            }
            .map { _, _, email, password in
                return UserData(email: email, password: password)
            }
            .flatMap { userLoginInfo in
                useCase.login(user: userLoginInfo)
                    .asDriver()
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
            }
            .sink(receiveValue: { _ in
                print("--- debug --- goto main screen")
            })
            .store(in: cancelBag)
        
        return output
    }
}
