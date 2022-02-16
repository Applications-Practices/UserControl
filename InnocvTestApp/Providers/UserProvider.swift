//
//  UserProvider.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation
import UIKit

class UserProvider: ApiProvider {
    
    private func userRequest<T:Codable>(entity: T.Type, url: URL?, methodType: R.Requests.METHOD, body: [String:Any]?, completion: @escaping (_ result: Any?) -> ()) {
        self.commonRequest(entity: T.self, url: url, method: methodType, body: body, decodingStrategy: .convertFromSnakeCase, completion: { data, result, error in
            //Error
            if let error = error {
                completion(error)
                return
            }
            
            //Data entity
            if let data = data {
                completion(data)
                return
            }
            
            //Bool
            if let result = result {
                completion(result)
                return
            }

        }, failure: { error in
            //print("Error Updating User: " + error)
            completion(error)
        })
    }
    
    func createNewUser(id: Int, name: String, birthdate: Date, completion: @escaping (_ result: Bool?) -> ()) {
        var body = [String:Any]()
        body[UserEntity.ID] = id
        body[UserEntity.NAME] = name
        body[UserEntity.BIRTHDATE] = birthdate.iso8601withFractionalSeconds
        
        self.userRequest(entity: UserResponse.self, url: R.URLs.getUrlCreateNewUser(), methodType: .POST, body: body, completion: { result in
            if let result = result as? Bool {
                completion(result)
            }
            else {
                completion(nil)
            }
        })
    }
    
    func getUser(id: Int?, completion: @escaping (_ result: [UserEntity]?) -> ()) {
        var url: URL? = nil
        if let id = id {
            url = R.URLs.getUrlGetUser(id: id)
            self.userRequest(entity: UserEntity.self, url: url, methodType: .GET, body: nil, completion: { result in
                if let result = result as? UserEntity {
                    completion([result])
                }
                else {
                    completion(nil)
                }
            })
        }
        else {
            url = R.URLs.getUrlGetUserList()
            self.userRequest(entity: [UserEntity].self, url: url, methodType: .GET, body: nil, completion: { result in
                if let result = result as? [UserEntity] {
                    completion(result)
                }
                else {
                    completion(nil)
                }
            })
        }
    }
    
    func updateUser(id: Int, name: String, birthdate: Date, completion: @escaping (_ result: Bool?) -> ()) {
        var body = [String:Any]()
        body[UserEntity.ID] = id
        body[UserEntity.NAME] = name
        body[UserEntity.BIRTHDATE] = birthdate.iso8601withFractionalSeconds
        
        self.userRequest(entity: UserResponse.self, url: R.URLs.getUrlUpdateUser(), methodType: .PUT, body: body, completion: { result in
            if let result = result as? Bool {
                completion(result)
            }
            else {
                completion(nil)
            }
        })
    }
    
    func deleteUser(id: Int, completion: @escaping (_ result: Bool?) -> ()) {
        self.userRequest(entity: UserResponse.self, url: R.URLs.getUrlDeleteUser(id: id), methodType: .DELETE, body: nil, completion: { result in
            if let result = result as? Bool {
                completion(result)
            }
            else {
                completion(nil)
            }
        })
    }
    
}
