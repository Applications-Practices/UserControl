//
//  Keyboards.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 15/2/22.
//

import Foundation
import UIKit

extension R {
    
    struct Keyboards {
        
        private static var isKeyboardReadjusted = false
        
        // Moves up the main view when keyboard appears
        static func alertKeyboardDidOpen(sender: NSNotification, view: UIView) {
            if !R.Keyboards.isKeyboardReadjusted {
                if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    view.translatesAutoresizingMaskIntoConstraints = true
                    view.frame.origin.y -= keyboardSize.height / 2
                    
                    R.Keyboards.isKeyboardReadjusted = true
                }
            }
        }

        // Moves down the main view when keyboard disappears
        static func alertKeyboardDidClose(sender: NSNotification, view: UIView) {
            if R.Keyboards.isKeyboardReadjusted {
                if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    if view.frame.origin.y + keyboardSize.height != 0 {
                        view.frame.origin.y += keyboardSize.height / 2
                        
                        // Solves the UI jump issue when typing
                        view.setNeedsLayout()
                        view.layoutIfNeeded()
                        
                        R.Keyboards.isKeyboardReadjusted = false
                    }
                }
            }
        }
        
    }
    
}
