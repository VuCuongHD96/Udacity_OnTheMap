//
//  AddLocationResponse.swift
//  Udacity_OnTheMap
//
//  Created by Work on 3/5/24.
//

import Foundation

struct AddLocationResponse: Codable {
    let objectID, createdAt: String

    enum CodingKeys: String, CodingKey {
        case objectID = "objectId"
        case createdAt
    }
}
