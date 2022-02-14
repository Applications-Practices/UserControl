//
//  UIViewController.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    //MARK: Functions
    //Load new ViewController with custom configuration
    func loadViewController(_ viewController: UIViewController, animated: Bool, _ modalPresentationStyle: UIModalPresentationStyle?, _ modalTransitionStyle: UIModalTransitionStyle?, completion: (() -> Void)?) {
        
        if let modalPresentationStyle = modalPresentationStyle {
            viewController.modalPresentationStyle = modalPresentationStyle
        }
        
        if let modalTransitionStyle = modalTransitionStyle {
            viewController.modalTransitionStyle = modalTransitionStyle
        }
        
        self.present(viewController, animated: animated, completion: completion)
    }
    
}
