//
//  URLs.swift
//
//  Created by Work on 12/03/2023.
//

import Foundation

struct URLs {
    private static let baseURL = "https://onthemap-api.udacity.com/v1"
    static let login = baseURL + "/session"
    static let logout = baseURL + "/session"
    static let location = baseURL + "/StudentLocation"
    static let userInfo = baseURL + "/users"
}
