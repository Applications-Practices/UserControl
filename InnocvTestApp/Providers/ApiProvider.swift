//
//  ApiProvider.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation

class ApiProvider {

    //MARK: Functions
    
    //Create and send generic Request to use with every Model.
    //Return
    //-ModelResponse if request is okey.
    //-Nil if request is invalid
    func commonRequest<T: Codable>(entity: T.Type, url:URL?, method: R.Requests.METHOD, body: [String:Any]?, decodingStrategy: JSONDecoder.KeyDecodingStrategy?, completion: @escaping (_ data: T?, _ result: Bool?, _ error: Error?) -> (), failure: @escaping (_ error: String) -> ()) {
        guard let url = url else { return completion(nil, false, nil) }
        let request = R.Requests.createRequest(url: url, method: method, body: body)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != R.Requests.CODE.ACCEPT.rawValue {
                    failure(String(httpResponse.statusCode))
                    return
                }
            }
            
            if let error = error {
                failure(error.localizedDescription)
                return
            }
            
            guard let data = data else { return completion(nil, false, error) }

            if data.isEmpty {
                completion(nil, true, error)
                return
            }
            guard let response = R.Requests.genericDecoder(T.self, from: data, decodingStrategy: decodingStrategy) else { return completion(nil, false, error) }
            
            completion(response, true, error)
        }).resume()
    }
    
}

