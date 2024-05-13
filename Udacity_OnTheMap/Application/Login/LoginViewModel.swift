//
//  LoginViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/03/2024.
//

import Combine
import Foundation

struct LoginViewModel {
    
    let useCase: UserUseCaseType
    let navigator: LoginNavigatorType
    var studentInfo = StudentInfo.shared
}

extension LoginViewModel: ViewModel {
    
    class Input: ObservableObject {
        @Published var emailValue = ""
        @Published var passwordValue = ""
        var loginAction = PassthroughSubject<Void, Never>()
        var signUpAction = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var loginIsValid = false
        @Published var alertMessage = AlertMessage()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        errorTracker.map { error in
            AlertMessage(error: error)
        }
        .assign(to: \.alertMessage, on: output)
        .store(in: cancelBag)
        
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

        input.loginAction
            .prefix(1)
            .map { _ in
                return UserData(email: input.emailValue, password: input.passwordValue)
            }
            .flatMap { userLoginInfo in
                useCase.login(user: userLoginInfo)
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
                    .asDriver()
            }
            .handleEvents(receiveOutput: {
                studentInfo.uniqueKey = $0.account.key
            })
            .flatMap {
                useCase.getUserInfo(id: $0.account.key)
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
                    .asDriver()
            }
            .handleEvents(receiveOutput: { userInfo in
                studentInfo.firstName = userInfo.firstName
                studentInfo.lastName = userInfo.lastName
            })
            .sink(receiveValue: { _ in
                navigator.toTabbar()
            })
            .store(in: cancelBag)

        input.signUpAction
            .sink { _ in
                navigator.signUp()
            }
            .store(in: cancelBag)
        
        return output
    }
}
