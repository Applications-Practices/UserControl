//
//  UserProvider.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation

class UserProvider: ApiProvider {
    
    func createNewUser(id: Int, name: String, birthdate: Date, completion: @escaping (_ result: Bool) -> ()) {
        var body = [String:Any]()
        body[UserEntity.ID] = id
        body[UserEntity.NAME] = name
        body[UserEntity.BIRTHDATE] = birthdate.iso8601withFractionalSeconds
        
        self.commonRequest(entity: UserResponse.self, url: R.URLs.getUrlCreateNewUser(), method: .POST, body: body, decodingStrategy: .convertFromSnakeCase, completion: { data, result, error in
            if let _ = error { completion(false) }
            
            guard let result = result else { return completion(false) }

            completion(result)
        }, failure: { error in
            completion(false)
            print("Error Creating New User: " + error)
        })
    }
    
    func updateUser(id: Int, name: String, birthdate: Date, completion: @escaping (_ result: Bool) -> ()) {
        var body = [String:Any]()
        body[UserEntity.ID] = id
        body[UserEntity.NAME] = name
        body[UserEntity.BIRTHDATE] = birthdate.iso8601withFractionalSeconds
        
        self.commonRequest(entity: UserResponse.self, url: R.URLs.getUrlUpdateUser(), method: .PUT, body: body, decodingStrategy: .convertFromSnakeCase, completion: { data, result, error in
            if let _ = error { completion(false) }
            
            guard let result = result else { return completion(false) }

            completion(result)
        }, failure: { error in
            completion(false)
            print("Error Updating User: " + error)
        })
    }
    
    func deleteUser(id: Int, completion: @escaping (_ result: Bool) -> ()) {
        self.commonRequest(entity: UserResponse.self, url: R.URLs.getUrlDeleteUser(id: id), method: .DELETE, body: nil, decodingStrategy: .convertFromSnakeCase, completion: { data, result, error in
            if let _ = error { completion(false) }
            
            guard let result = result else { return completion(false) }

            completion(result)
        }, failure: { error in
            completion(false)
            print("Error Deleting User: " + error)
        })
    }
    
    /*func getUserList(completion: @escaping (_ result: [UserEntity]?) -> ()) {
        self.commonRequest(entity: UserResponse.self, url: R.URLs.getUrlCreateNewUser(), method: .GET, body: nil, decodingStrategy: .convertFromSnakeCase, completion: { result in
            guard let result = result else { return completion([]) }

            completion(result.users)
        }, failure: { error in
            completion([])
            print("Error Getting User List: " + error)
        })
    }*/
    
}
