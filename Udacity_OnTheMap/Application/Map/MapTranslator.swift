//
//  MapTranslator.swift
//  Udacity_OnTheMap
//
//  Created by Work on 30/03/2024.
//

import CoreLocation

struct MapTranslator {

    static func createLocationViewItemList(from studentLocationList: [StudentLocation]) -> [LocationViewItem] {
        studentLocationList.map {
            let locationName = $0.firstName + " " + $0.lastName
            let coordinate = CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
            return LocationViewItem.init(name: locationName, coordinate: coordinate, website: $0.mediaURL)
        }
    }
}
