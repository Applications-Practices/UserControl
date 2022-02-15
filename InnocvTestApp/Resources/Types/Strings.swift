//
//  Strings.swift
//  InnocvTestApp
//
//  Created by Pablo López Iborra on 14/2/22.
//

import Foundation

extension R {
    
    struct Strings {
        
        //MARK: Variables
        //Home
        static var homeTitle: String {
            return NSLocalizedString("title_label_home", comment: "")
        }
        static var homeCreateNewUser: String {
            return NSLocalizedString("title_button_create_new_user_home", comment: "")
        }
        static var homeGetUserList: String {
            return NSLocalizedString("title_button_get_user_list_home", comment: "")
        }
        static var homeGetUser: String {
            return NSLocalizedString("title_button_get_user_home", comment: "")
        }
        static var homeUpdateUser: String {
            return NSLocalizedString("title_button_update_user_home", comment: "")
        }
        static var homeDeleteUser: String {
            return NSLocalizedString("title_button_delete_new_user_home", comment: "")
        }
        static var homeUndoLastUserAction: String {
            return NSLocalizedString("title_button_undo_last_user_action_home", comment: "")
        }
        static var homeTitleSuccessfulActionAlert: String {
            return NSLocalizedString("title_successful_alert_home", comment: "")
        }
        static var homeTextSuccessfulActionAlert: String {
            return NSLocalizedString("text_successful_alert_home", comment: "")
        }
        static var homeTitleUnsuccessfulActionAlert: String {
            return NSLocalizedString("title_unsuccessful_alert_home", comment: "")
        }
        static var homeTextUnsuccessfulActionAlert: String {
            return NSLocalizedString("text_unsuccessful_alert_home", comment: "")
        }
        static var homeTitleActionButtonResultAlert: String {
            return NSLocalizedString("title_action_button_result_alert_home", comment: "")
        }
        
        //CRUD Alert
        static var crudAlertIDTextfield: String {
            return NSLocalizedString("text_id_textfield_crud_alert", comment: "")
        }
        static var crudAlertNameTextfield: String {
            return NSLocalizedString("text_name_textfield_crud_alert", comment: "")
        }
        static var crudAlertBirthdateTextfield: String {
            return NSLocalizedString("text_birthdate_textfield_crud_alert", comment: "")
        }
        static var crudAlertCalendarButton: String {
            return NSLocalizedString("text_calendar_button_crud_alert", comment: "")
        }
        static var crudAlertCancelButton: String {
            return NSLocalizedString("text_cancel_button_crud_alert", comment: "")
        }
        static var crudAlertAcceptButton: String {
            return NSLocalizedString("text_accept_button_crud_alert", comment: "")
        }
        
        //Keyboard
        static var keyboardCancelButton: String {
            return NSLocalizedString("text_cancel_button_keyboard", comment: "")
        }
        static var keyboardDoneButton: String {
            return NSLocalizedString("text_done_button_keyboard", comment: "")
        }
    }
    
}
