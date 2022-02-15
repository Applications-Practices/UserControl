//
//  HomeViewController.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var newUserButton: UIButton!
    @IBOutlet weak var getUserListButton: UIButton!
    @IBOutlet weak var getUserButton: UIButton!
    @IBOutlet weak var updateUserButton: UIButton!
    @IBOutlet weak var deleteUserButton: UIButton!
    @IBOutlet weak var undoLastUserActionButton: UIButton!
    
    override func viewDidLoad() {
        self.setup()
    }
    
    func setup() {
        self.setDefaultElements()
    }
    
    func setDefaultElements() {
        self.setDefaultText()
    }
    
    func setDefaultText() {
        self.newUserButton.setTitle(R.Strings.homeCreateNewUser, for: .normal)
        
        self.getUserListButton.setTitle(R.Strings.homeGetUserList, for: .normal)
        self.getUserListButton.isHidden = true
        
        self.getUserButton.setTitle(R.Strings.homeGetUser, for: .normal)
        self.getUserButton.isHidden = true
        
        self.updateUserButton.setTitle(R.Strings.homeUpdateUser, for: .normal)
        
        self.deleteUserButton.setTitle(R.Strings.homeDeleteUser, for: .normal)
        
        self.undoLastUserActionButton.setTitle(R.Strings.homeUndoLastUserAction, for: .normal)
        self.undoLastUserActionButton.isHidden = true
    }
    
    private func createNewUser() {
        self.createCRUDAlert(title: R.Strings.homeCreateNewUser, crudType: .POST, acceptAction: { alert in
            var id = 0
            var name = ""
            var birthdate = Date()
            
            if let idAlert = alert.id {
                id = idAlert
            }
            
            if let nameAlert = alert.name {
                name = nameAlert
            }
            
            if let birthdateDate = alert.birthdate {
                birthdate = birthdateDate
            }
            
            UserProvider().createNewUser(id: id, name: name, birthdate: birthdate, completion: { result in
                DispatchQueue.main.async {
                    self.createResultAlert(result: result)
                }
            })
        })
    }
    
    private func updateUser() {
        self.createCRUDAlert(title: R.Strings.homeUpdateUser, crudType: .PUT, acceptAction: { alert in
            var id = 0
            var name = ""
            var birthdate = Date()
            
            if let idAlert = alert.id {
                id = idAlert
            }
            
            if let nameAlert = alert.name {
                name = nameAlert
            }
            
            if let birthdateDate = alert.birthdate {
                birthdate = birthdateDate
            }
            
            UserProvider().updateUser(id: id, name: name, birthdate: birthdate, completion: { result in
                DispatchQueue.main.async {
                    self.createResultAlert(result: result)
                }
            })
        })
    }
    
    private func deleteUser() {
        self.createCRUDAlert(title: R.Strings.homeDeleteUser, crudType: .DELETE, acceptAction: { alert in
            var id = 0
            
            if let idAlert = alert.id {
                id = idAlert
            }
            
            UserProvider().deleteUser(id: id, completion: { result in
                DispatchQueue.main.async {
                    self.createResultAlert(result: result)
                }
            })
        })
    }
    
    private func createCRUDAlert(title: String, crudType: R.Requests.METHOD, acceptAction: ((_ alert: CRUDAlert) -> Void)?) {
        let _ = R.Alerts.createCRUDAlert(title: title, crudType: crudType, acceptAction: acceptAction)
    }
    
    private func createResultAlert(result: Bool) {
        let action = R.Alerts.createAction(title: R.Strings.homeTitleActionButtonResultAlert, style: .destructive, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        })
        
        var titleAlert = ""
        var messageAlert = ""
        
        if result {
            titleAlert = R.Strings.homeTitleSuccessfulActionAlert
            messageAlert = R.Strings.homeTextSuccessfulActionAlert
        }
        else {
            titleAlert = R.Strings.homeTitleUnsuccessfulActionAlert
            messageAlert = R.Strings.homeTextUnsuccessfulActionAlert
        }
        
        let alert = R.Alerts.loadAlert(title: titleAlert, message: messageAlert, preferredStryle: .alert, actions: [action])
        self.loadViewController(alert, animated: true, nil, nil, completion: nil)
    }
    
    //Button Actions
    @IBAction func didTapNewUserButton(_ sender: Any) {
        self.createNewUser()
    }
    
    @IBAction func didTapGetUserListButton(_ sender: Any) {
    
    }
    
    @IBAction func didTapGetUserButton(_ sender: Any) {
    
    }
    
    @IBAction func didTapUpdateUserButton(_ sender: Any) {
        self.updateUser()
    }
    
    @IBAction func didTapDeleteUserButton(_ sender: Any) {
        self.deleteUser()
    }
    
    @IBAction func didTapUndoLastUserActionButton(_ sender: Any) {
    
    }
}
