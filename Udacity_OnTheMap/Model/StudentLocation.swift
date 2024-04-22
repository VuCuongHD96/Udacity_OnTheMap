//
//  StudentLocation.swift
//  Udacity_OnTheMap
//
//  Created by Work on 25/03/2024.
//

import Foundation

struct StudentLocation: Decodable {
    let firstName, lastName: String
    let longitude, latitude: Double
    let mapString: String
    let mediaURL: String
    let uniqueKey, objectId, createdAt, updatedAt: String
}
