//
//  UserData.swift
//  Udacity_OnTheMap
//
//  Created by Work on 3/5/24.
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
