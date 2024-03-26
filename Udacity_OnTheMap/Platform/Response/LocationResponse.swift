//
//  LocationResponse.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Foundation

struct LocationResponse: Decodable {
    
    let locationList: [StudentLocation]
    
    enum CodingKeys: String, CodingKey {
        case locationList = "results"
    }
}
