//
//  UserInfoRequest.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/4/24.
//

import Foundation

class UserInfoRequest: ServiceBaseRequest {
    
    init(id: String) {
        super.init(urlString: URLs.userInfo + "/" + id, requestType: .get)
    }
}
