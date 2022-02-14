//
//  URLs.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct URLs {
        
        //MARK: API
        private static let apiCreateNewUser = Constants.API_BASE_URL + Constants.API_CREATE_NEW_USER
        private static let apiGetUserList   = Constants.API_BASE_URL + Constants.API_GET_USER_LIST
        private static let apiGetUser       = Constants.API_BASE_URL + Constants.API_GET_USER
        private static let apiUpdateUser    = Constants.API_BASE_URL + Constants.API_UPDATE_USER
        private static let apiDeleteUser    = Constants.API_BASE_URL + Constants.API_UPDATE_USER
        
        //MARK: Functions
        //Generics
        static func createURL(string: String) -> URL? {
            let string = string.replacingOccurrences(of: " ", with: "_")
            return URL(string: string)
        }
        
        static func canOpenURL(url: URL) -> URL? {
            if UIApplication.shared.canOpenURL(url) {
                return url
            }
            else {
                return nil
            }
        }
        
        static func openURL(url: URL) {
            UIApplication.shared.open(url)
        }
        
        //API Endpoints
        static func getUrlCreateNewUser() -> URL? {
            return self.createURL(string: self.apiCreateNewUser)
        }
        
        static func getUrlGetUserList() -> URL? {
            return self.createURL(string: self.apiGetUserList)
        }
        
        static func getUrlGetUser() -> URL? {
            return self.createURL(string: self.apiGetUser)
        }
        
        static func getUrlUpdateUser() -> URL? {
            return self.createURL(string: self.apiUpdateUser)
        }
        
        static func getUrlDeleteUser(id: Int) -> URL? {
            return self.createURL(string: self.apiDeleteUser + "/\(id)")
        }
        
    }
    
}

