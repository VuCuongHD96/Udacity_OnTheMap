//
//  AddLocationViewModel.swift
//  Udacity_OnTheMap
//
//  Created by Work on 25/4/24.
//

import Combine
import CoreLocation

struct FindLocationViewModel {
    
    var studentInfo = StudentInfo.shared
    let navigator: FindLocationNavigatorType
}

extension FindLocationViewModel: ViewModel {
    
    class Input: ObservableObject {
        let backAction = PassthroughSubject<Void, Never>()
        @Published var locationString = ""
        @Published var websiteString = ""
        let findLocationAction = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var findButtonStatus = false
        @Published var isWebsiteValid = true
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        
        input.backAction
            .sink {
                navigator.goBack()
            }
            .store(in: cancelBag)
        
        let isLocationValid = input.$locationString
            .map {
                !$0.isEmpty
            }
        
        let isWebsiteValid = input.$websiteString
            .map {
                $0
                    .lowercased()
                    .contains("http://")
            }
        
        isWebsiteValid
            .dropFirst()
            .assign(to: \.isWebsiteValid, on: output)
            .store(in: cancelBag)
        
        Publishers.CombineLatest(isLocationValid, isWebsiteValid)
            .map {
                $0 && $1
            }
            .assign(to: \.findButtonStatus, on: output)
            .store(in: cancelBag)
        
        input.findLocationAction
            .flatMap { 
                GeocoderManager.geocodeAddressString(locationString: input.locationString)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .map { maker in
                maker.first?.location
            }
            .compactMap { location in
                location?.coordinate
            }
            .handleEvents(receiveOutput: {
                studentInfo.mapString = input.locationString
                studentInfo.mediaURL = input.websiteString
                studentInfo.latitude = $0.latitude
                studentInfo.longitude = $0.longitude
            })
            .sink(receiveValue: { location in
                let locationViewItem = LocationViewItem(name: input.locationString, coordinate: location)
                navigator.goToAddLocationScreen(locationViewItem: locationViewItem)
            })
            .store(in: cancelBag)
        
        return output
    }
}
