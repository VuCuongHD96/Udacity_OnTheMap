//
//  LocationRequest.swift
//  Udacity_OnTheMap
//
//  Created by Work on 26/03/2024.
//

import Foundation

class LocationRequest: ServiceBaseRequest {
    
    init(limit: Int) {
        let params = [
            "limit": limit
        ]
        super.init(urlString: URLs.location, requestType: .get, params: params)
    }
}
