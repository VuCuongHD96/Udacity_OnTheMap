//
//  LocationListViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Combine
import Foundation
import UIKit

struct LocationListViewModel {
    
    let useCase: LocationUseCaseType
}

extension LocationListViewModel: ViewModel {
    
    class Input: ObservableObject {
        var loadTrigger = PassthroughSubject<Void, Never>()
        var locationItemSelectedAction = PassthroughSubject<StudentLocation, Never>()
    }
    
    class Output: ObservableObject {
        @Published var locationList: [StudentLocation] = []
        @Published var alertMessage = AlertMessage()
    }

    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        errorTracker.map {
            AlertMessage(error: $0)
        }
        .assign(to: \.alertMessage, on: output)
        .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap {
                useCase.getLocationList()
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
                    .asDriver()
            }
            .assign(to: \.locationList, on: output)
            .store(in: cancelBag)
        
        input.locationItemSelectedAction
            .compactMap { studentLocation in
                URL(string: studentLocation.mediaURL)
            }
            .flatMap { url in
                openURL(url)
                    .trackError(errorTracker)
                    .trackActivity(activityTracker)
                    .asDriver()
            }
            .sink(receiveValue: { url in
                UIApplication.shared.open(url)
            })
            .store(in: cancelBag)
        
        return output
    }
}
