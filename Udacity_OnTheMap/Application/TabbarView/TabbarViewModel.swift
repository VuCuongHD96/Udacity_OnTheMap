//
//  TabbarViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 21/4/24.
//

import Combine

struct TabbarViewModel {
    
    let userUseCase: UserUseCaseType
    let navigator: TabbarNavigatorType
    var studentInfo = StudentInfo.shared
}

extension TabbarViewModel: ViewModel {
 
    struct Input {
        
        var logoutAction = PassthroughSubject<Void, Never>()
        var addAction = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        input.logoutAction
            .flatMap {
                userUseCase.logout()
                    .asDriver()
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
            }
            .handleEvents(receiveOutput: {
                studentInfo.clearAllData()
            })
            .sink {
                navigator.goBack()
            }
            .store(in: cancelBag)
        
        input.addAction
            .sink {
                navigator.toAddScreen()
            }
            .store(in: cancelBag)
        
        return output
    }
}
