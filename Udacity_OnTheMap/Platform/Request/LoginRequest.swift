//
//  LoginRequest.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation

class LoginRequest: ServiceBaseRequest {
    
    init(user: UserData) {
        super.init(urlString: URLs.login, requestType: .post, body: user)
    }
}
