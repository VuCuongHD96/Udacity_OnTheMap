//
//  LoginResponse.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation

struct Account: Codable {
    let registered: Bool
    let key: String
}

struct Session: Codable {
    let id: String
}

struct LoginResponse: Codable {
    let account: Account
    let session: Session
}
