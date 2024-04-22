//
//  UserInfoResponse.swift
//  Udacity_OnTheMap
//
//  Created by Work on 23/4/24.
//

import Foundation

struct UserInfoResponse: Decodable {
    let lastName: String
    let firstName: String
    let nickname: String
    
    enum CodingKeys: String, CodingKey {
        case lastName = "last_name"
        case firstName = "first_name"
        case nickname
    }
}
