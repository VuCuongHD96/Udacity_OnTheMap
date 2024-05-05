//
//  LocationRepository.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Foundation

protocol LocationRepositoryType {

    func getLocationList() -> Observable<[StudentLocation]>
    func sendLocation(studentInfoData: StudentInfoData) -> Observable<String>
}

class LocationRepository: ServiceBaseRepository, LocationRepositoryType {
    
    func getLocationList() -> Observable<[StudentLocation]> {
        let request = LocationRequest(limit: 100)
        return api.request(input: request)
            .map { (data: LocationResponse) in
                return data.locationList
            }
            .eraseToAnyPublisher()
    }
    
    func sendLocation(studentInfoData: StudentInfoData) -> Observable<String> {
        let request = LocationRequest(studentInfoData: studentInfoData)
        return api.request(input: request)
            .map { (data: AddLocationResponse) in
                return data.objectID
            }
            .eraseToAnyPublisher()
    }
}
