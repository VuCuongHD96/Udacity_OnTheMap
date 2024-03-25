//
//  LoginResponse.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation

struct AccountEntity: Codable {
    let registered: Bool
    let key: String
}

struct SessionEntity: Codable {
    let id: String
}

struct LoginResponse: Codable {
    let account: AccountEntity
    let session: SessionEntity
}
