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

        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 400))
        datePicker.datePickerMode = .dateAndTime
        self.inputView = datePicker

        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: R.Strings.keyboardCancelButton, style: .plain, target: self, action: #selector(cancelPressed))
        let doneBarButton = UIBarButtonItem(title: R.Strings.keyboardDoneButton, style: .plain, target: target, action: selector)
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)

        self.inputAccessoryView = toolBar
    }

    @objc func cancelPressed() {
        self.resignFirstResponder()
    }
}
