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
        
        //MARK: Variables
        private static var crudAlertName = "CRUDAlert"
        
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
        
        static func createCRUDAlert(title: String, crudType: R.Requests.METHOD, acceptAction: ((_ alert: CRUDAlert) -> Void)?) -> CRUDAlert? {
            let crudAlert = Bundle.main.loadNibNamed(R.Alerts.crudAlertName, owner: self, options: nil)?.first as? CRUDAlert
            
            crudAlert?.frame = R.window!.bounds
            crudAlert?.setup(title: title, crudType: crudType)
            crudAlert?.acceptAction = acceptAction
            
            guard let crudAlert = crudAlert else { return nil }
            
            R.window?.addSubview(crudAlert)
            
            return crudAlert
        }
    }
    
}
