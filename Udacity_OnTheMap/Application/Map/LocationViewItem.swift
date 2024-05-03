//
//  LocationViewItem.swift
//  Udacity_OnTheMap
//
//  Created by Work on 30/03/2024.
//

import CoreLocation

struct LocationViewItem {
    
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
    
    init() {
        self.init(name: "", coordinate: CLLocationCoordinate2D())
    }
}
