//
//  AddLocationViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 3/5/24.
//

import Combine

struct AddLocationViewModel {
    
    var studentInfo = StudentInfo.shared
    let locationFound: LocationViewItem
    let navigator: AddLocationNavigatorType
    let locationUseCase = LocationUseCase()
}

extension AddLocationViewModel: ViewModel {
    
    struct Input {
        var addLocationAction = PassthroughSubject<Void, Never>()
        var backAction = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var locationFound = LocationViewItem()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        input.addLocationAction
            .map {
                StudentInfoData(
                    uniqueKey: studentInfo.uniqueKey,
                    firstName: studentInfo.firstName,
                    lastName: studentInfo.lastName,
                    mapString: studentInfo.mapString, mediaURL: studentInfo.mediaURL, latitude: studentInfo.latitude,
                    longitude: studentInfo.longitude
                )
            }
            .flatMap {
                locationUseCase.sendLocation(studentInfoData: $0)
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
                    .asDriver()
            }
            .sink(receiveValue: { _ in
                navigator.popToTabbar()
            })
            .store(in: cancelBag)
        
        Just(locationFound)
            .assign(to: \.locationFound, on: output)
            .store(in: cancelBag)
        
        input.backAction
            .sink {
                navigator.goBack()
            }
            .store(in: cancelBag)
        
        return output
    }
}
