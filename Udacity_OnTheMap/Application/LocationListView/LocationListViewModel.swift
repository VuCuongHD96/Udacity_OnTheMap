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
    
    struct Input {
        var loadTrigger = Driver.just(Void())
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
