//
//  LogoutRequest.swift
//  Udacity_OnTheMap
//
//  Created by Work on 25/03/2024.
//

import Foundation

class LogoutRequest: ServiceBaseRequest {
    
    init() {
        super.init(urlString: URLs.logout, requestType: .delete)
    }
}
