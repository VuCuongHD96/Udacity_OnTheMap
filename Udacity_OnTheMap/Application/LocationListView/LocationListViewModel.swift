//
//  LocationListViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Combine

struct LocationListViewModel {
    
    let useCase: LocationUseCaseType
}

extension LocationListViewModel: ViewModel {
    
    class Input: ObservableObject {
        var loadTrigger = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var locationList: [StudentLocation] = []
    }

    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        input.loadTrigger
            .flatMap {
                useCase.getLocationList()
                    .asDriver()
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
            }
            .assign(to: \.locationList, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
