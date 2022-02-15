//
//  CRUDAlert.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 15/2/22.
//

import Foundation
import UIKit

class CRUDAlert: UIView {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdateTextField: UITextField!
    @IBOutlet weak var calendarButton: UIButton!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    var typeAlert: R.Requests.METHOD = .POST
    
    var id: Int? = nil
    var name: String? = nil
    var birthdate: Date? = nil
    
    public var acceptAction: ((_ alert: CRUDAlert) -> Void)? = nil
    
    func setup(title: String, crudType: R.Requests.METHOD) {
        self.setTitleLabel(title: title)
        self.typeAlert = crudType
        self.mainView.layer.cornerRadius = 12
        
        self.setupObservers()
        self.setupInitialConfiguration()
    }
    
    private func setTitleLabel(title: String) {
        self.titleLabel.text = title
    }
    
    private func setupObservers() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(alertKeyboardDidOpen), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(alertKeyboardDidClose), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setupInitialConfiguration() {
        self.setTypeAlert()
        self.setActiveButton(button: self.cancelButton, enable: true)
        self.setActiveButton(button: self.acceptButton, enable: false)
    }
    
    private func setTypeAlert() {
        switch self.typeAlert {
        case .POST:
            self.idTextField.isHidden = false
            self.idTextField.isEnabled = true
            self.nameTextField.isHidden = false
            self.nameTextField.isEnabled = true
            self.birthdateTextField.isHidden = false
            self.birthdateTextField.isEnabled = false
            self.calendarButton.isHidden = false
            self.setActiveButton(button: self.calendarButton, enable: true)
        case .GET:
            self.idTextField.isHidden = false
            self.idTextField.isEnabled = true
            self.nameTextField.isHidden = true
            self.nameTextField.isEnabled = false
            self.birthdateTextField.isHidden = true
            self.calendarButton.isHidden = true
            self.birthdateTextField.isEnabled = false
            self.setActiveButton(button: self.calendarButton, enable: false)
        case .PUT:
            self.idTextField.isHidden = false
            self.idTextField.isEnabled = true
            self.nameTextField.isHidden = false
            self.nameTextField.isEnabled = true
            self.birthdateTextField.isHidden = false
            self.calendarButton.isHidden = false
            self.birthdateTextField.isEnabled = false
            self.setActiveButton(button: self.calendarButton, enable: true)
        case .DELETE:
            self.idTextField.isHidden = false
            self.idTextField.isEnabled = true
            self.nameTextField.isHidden = true
            self.nameTextField.isEnabled = false
            self.birthdateTextField.isHidden = true
            self.calendarButton.isHidden = true
            self.birthdateTextField.isEnabled = false
            self.setActiveButton(button: self.calendarButton, enable: false)
        }
    }
    
    private func checkId() {
        if let idString = self.idTextField.text {
            if let idInt = Int(idString) {
                self.id = idInt
            }
        }
    }
    
    private func checkName() {
        if let nameString = self.nameTextField.text {
            self.name = nameString
        }
    }
    
    private func setActiveButton(button: UIButton, enable: Bool) {
        button.isEnabled = enable
        
        if enable {
            button.alpha = 1
        }
        else {
            button.alpha = 0.6
        }
    }
    
    private func setActiveAcceptButton() {
        var activeButton = true
        
        if !self.idTextField.isHidden && (self.idTextField.text?.isEmpty ?? true) {
            activeButton = false
        }
        if !self.nameTextField.isHidden && (self.nameTextField.text?.isEmpty ?? true) {
            activeButton = false
        }
        if !self.birthdateTextField.isHidden && (self.birthdateTextField.text?.isEmpty ?? true) {
            activeButton = false
        }
        
        self.setActiveButton(button: self.acceptButton, enable: activeButton)
    }
    
    private func setAcceptAction() {
        self.checkId()
        self.checkName()
        
        self.acceptAction?(self)
    }
    
    private func setCancelAction() {
        self.removeFromSuperview()
    }
    
    @IBAction func didTapCalendarButton(_ sender: Any) {
        
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        self.setCancelAction()
    }
    
    @IBAction func didTapAcceptButton(_ sender: Any) {
        self.setAcceptAction()
    }
    
    @objc func dismissKeyboard(){
        self.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.setActiveAcceptButton()
    }
    
    @objc func alertKeyboardDidOpen(sender: NSNotification) {
        R.Keyboards.alertKeyboardDidOpen(sender: sender, view: self)
    }

    @objc func alertKeyboardDidClose(sender: NSNotification) {
        R.Keyboards.alertKeyboardDidClose(sender: sender, view: self)
    }
}
