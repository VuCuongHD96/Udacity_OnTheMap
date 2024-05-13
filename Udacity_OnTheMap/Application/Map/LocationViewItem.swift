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
    let website: String
    
    init(name: String, coordinate: CLLocationCoordinate2D, website: String) {
        self.name = name
        self.coordinate = coordinate
        self.website = website
    }
    
    init() {
        self.init(name: "", coordinate: CLLocationCoordinate2D(), website: "")
    }
}
