//
//  StudentInfo.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/4/24.
//

import Foundation

class StudentInfo {
    
    static let shared = StudentInfo()
    
    var uniqueKey = ""
    var firstName = ""
    var lastName = ""
    var mapString = ""
    var mediaURL = ""
    var latitude: Double = 0
    var longitude: Double = 0
    
    func clearAllData() {
        uniqueKey = ""
        firstName = ""
        lastName = ""
        mapString = ""
        mediaURL = ""
        latitude = 0
        longitude = 0
    }
}
