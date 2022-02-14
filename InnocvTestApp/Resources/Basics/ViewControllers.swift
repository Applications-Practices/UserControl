//
//  ViewControllers.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct ViewControllers {
        
        //MARK: Varibales
        //Home
        static var homeNavigationController = "HomeNavigationController"
        static var homeViewController       = "HomeViewController"
        
        //MARK: Functions
        static func loadViewController<T: UIViewController>(_: T.Type, _ storyboard: String, _ viewControllerIdentifier: String) -> T? {
            let storyboard = UIStoryboard(name: storyboard, bundle: nil)
            if let viewController = storyboard.instantiateViewController (withIdentifier: viewControllerIdentifier) as? T {
                return viewController
            }
            else {
                return nil
            }
        }
        
        static func loadHomeViewController() -> UIViewController {
            return R.ViewControllers.loadViewController(UINavigationController.self, R.Storyboards.home, R.ViewControllers.homeNavigationController)!
        }
    }
    
}

