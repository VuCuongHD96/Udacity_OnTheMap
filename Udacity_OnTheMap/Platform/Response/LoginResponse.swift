//
//  LoginResponse.swift
//  Udacity_OnTheMap
//
//  Created by Work on 22/03/2024.
//

import Foundation

struct LoginResponse: Codable {
    let account: AccountEntity
    let session: SessionEntity
}
