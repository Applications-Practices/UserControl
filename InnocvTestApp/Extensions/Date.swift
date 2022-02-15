//
//  Date.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation

extension Date {
    var iso8601withFractionalSeconds: String {
        return Formatter.iso8601withFractionalSeconds.string(from: self)
    }
    
    var europeanDateString: String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = Constants.dateFormatterEU
        
        return dateFormatter.string(from: self)
    }
    
    var americanDateString: String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = Constants.dateFormatterUUEE
        
        return dateFormatter.string(from: self)
    }
}
