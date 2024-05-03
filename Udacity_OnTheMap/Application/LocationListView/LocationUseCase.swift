//
//  LocationUseCase.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Foundation

protocol LocationUseCaseType {
    
    func getLocationList() -> Observable<[StudentLocation]>
    func sendLocation(studentInfoData: StudentInfoData) -> Observable<String>
}

struct LocationUseCase: LocationUseCaseType {
    
    let locationRepository = LocationRepository(api: .share)
    
    func getLocationList() -> Observable<[StudentLocation]> {
        return locationRepository.getLocationList()
    }
    
    func sendLocation(studentInfoData: StudentInfoData) -> Observable<String> {
        return locationRepository.sendLocation(studentInfoData: studentInfoData)
    }
}
