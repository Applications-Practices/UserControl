//
//  UserEntity.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation

struct UserEntity: Codable {
    
    var id: Int
    var name: String
    var birthdate: String
    
    static let ID           = "id"
    static let NAME         = "name"
    static let BIRTHDATE    = "birthdate"
    
    init(id: Int?, name: String?, birthdate: String?) {
        self.id = id                ?? -1
        self.name = name            ?? ""
        self.birthdate = birthdate  ?? String()
    }
    
}
    
