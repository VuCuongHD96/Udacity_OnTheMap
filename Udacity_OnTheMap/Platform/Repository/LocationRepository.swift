//
//  LocationRepository.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Foundation

protocol LocationRepositoryType {

    func getLocationList() -> Observable<[StudentLocation]>
}

class LocationRepository: ServiceBaseRepository, LocationRepositoryType {
    
    func getLocationList() -> Observable<[StudentLocation]> {
        let request = LocationRequest(limit: 20)
        return api.request(input: request)
            .map { (data: LocationResponse) in
                return data.locationList
            }
            .eraseToAnyPublisher()
    }
}
