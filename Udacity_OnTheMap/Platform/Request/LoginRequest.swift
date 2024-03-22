//
//  LoginRequest.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation

struct UserData: Encodable {
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case udacity
        case username
        case password
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var udacityContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .udacity)
        try udacityContainer.encode(email, forKey: .username)
        try udacityContainer.encode(password, forKey: .password)
    }
}

class LoginRequest: ServiceBaseRequest {
    
    init(user: UserData) {
        super.init(urlString: URLs.login, requestType: .post, body: user)
    }
}
