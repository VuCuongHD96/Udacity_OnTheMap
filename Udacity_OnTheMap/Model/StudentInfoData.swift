//
//  StudentInfoData.swift
//  Udacity_OnTheMap
//
//  Created by Work on 3/5/24.
//

import Foundation

struct StudentInfoData: Encodable {
    
    var uniqueKey = ""
    var firstName = ""
    var lastName = ""
    var mapString = ""
    var mediaURL = ""
    var latitude: Double = 0
    var longitude: Double = 0
}
