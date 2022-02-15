//
//  UIApplication.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 15/2/22.
//

import Foundation
import UIKit

extension UIApplication {
    
    //MARK: Variables
    //Main app windo
    class var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
    //MARK: Functions
    //Return current ViewController
    class func getCurrentViewController() -> UIViewController? {
        let keyWindow = UIApplication.keyWindow

        var viewController: UIViewController?
        
        if keyWindow != nil {
            if var topController = keyWindow!.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                
                viewController = topController
            }
        }
        
        return viewController
    }
}
