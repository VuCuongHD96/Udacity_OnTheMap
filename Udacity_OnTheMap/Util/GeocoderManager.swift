//
//  GeocoderManager.swift
//  Udacity_OnTheMap
//
//  Created by Work on 1/5/24.
//

import Foundation
import CoreLocation
import Combine

struct GeocoderManager {
    
    static func geocodeAddressString(locationString: String) -> Observable<[CLPlacemark]> {
        return Future<[CLPlacemark], Error> { promise in
            CLGeocoder().geocodeAddressString(locationString) { (marker, error) in
                if let marker = marker {
                    promise(.success(marker))
                } else if let error = error {
                    promise(.failure(error))
                } else {
                    print("Location Error")
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
