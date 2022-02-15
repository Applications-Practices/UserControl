//
//  UITextField.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 15/2/22.
//

import Foundation
import UIKit

extension UITextField {

    func addInputViewDatePicker(target: Any, selector: Selector) {
        let screenWidth = UIScreen.main.bounds.width
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 400))
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        //datePicker.sizeToFit()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .dateAndTime
        datePicker.layer.masksToBounds = true
        datePicker.center.x = view.center.x
        datePicker.backgroundColor = .clear
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: R.Strings.keyboardCancelButton, style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: R.Strings.keyboardDoneButton, style: .done, target: target, action: selector)
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)

        self.inputAccessoryView = toolBar
        
        view.addSubview(datePicker)
        self.inputView = view
    }

    @objc func cancelPressed() {
        self.resignFirstResponder()
    }
}
