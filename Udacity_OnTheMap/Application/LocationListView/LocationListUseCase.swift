//
//  LocationListUseCase.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Foundation

protocol LocationListUseCaseType {
    
    func getLocationList() -> Observable<[StudentLocation]>
}

struct LocationListUseCase: LocationListUseCaseType {
    
    let locationRepository = LocationRepository(api: .share)
    
    func getLocationList() -> Observable<[StudentLocation]> {
        return locationRepository.getLocationList()
    }
}
