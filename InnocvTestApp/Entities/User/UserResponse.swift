//
//  UserResponse.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation

struct UserResponse: Codable {

    var users: [UserEntity]
    
    init(users: [UserEntity]?) {
        self.users = users ?? []
    }
    
}
