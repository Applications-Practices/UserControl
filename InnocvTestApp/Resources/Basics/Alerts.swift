//
//  Alerts.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct Alerts {
        
        //MARK: Functions
        //Generic
        static func loadAlert(title: String, message: String, preferredStryle: UIAlertController.Style, actions: [UIAlertAction]) -> UIAlertController {
            let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStryle)
            
            for action in actions {
                alert.addAction(action)
            }
            
            return alert
        }
        
        static func createAction(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
            return UIAlertAction(title: title, style: style, handler: handler)
        }
    }
    
}
