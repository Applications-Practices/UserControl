//
//  Requests.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation

extension R {
    
    struct Requests {
        
        //MARK: Http method types
        enum METHOD : String {
            case GET
            case POST
            case PUT
            case DELETE
        }
        
        //MARK: Variables
        static var contentType      = "Content-Type"
        static var accept           = "Accept"
        static var applicationJson  = "application/json"
        
        //MARK: Functions
        static func createRequest(url: URL, method: METHOD, body: [String:Any]?) -> URLRequest {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.setValue(R.Requests.applicationJson, forHTTPHeaderField: R.Requests.contentType)
            request.setValue(R.Requests.applicationJson, forHTTPHeaderField: R.Requests.accept)
            
            if let requestBody = body {
                let bodyData = try? JSONSerialization.data(
                    withJSONObject: requestBody,
                    options: []
                )
                request.httpBody = bodyData
            }
            return request
        }
        
        static func genericDecoder<T: Codable>(_ type: T.Type, from data: Data, decodingStrategy: JSONDecoder.KeyDecodingStrategy?) -> T? {
            let decoder = JSONDecoder()
            if let strategy = decodingStrategy {
                decoder.keyDecodingStrategy = strategy
            }
            do {
                return try decoder.decode(type, from: data)
            } catch {
                return nil
            }
        }
    }
    
}

