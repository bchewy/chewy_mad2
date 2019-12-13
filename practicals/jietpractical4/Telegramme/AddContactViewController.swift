//
//  AddContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P03 on 5/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation
import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var firstNameFld: UITextField!
    
    @IBOutlet weak var lastNameFld: UITextField!
    
    @IBOutlet weak var mobileFld: UITextField!
    
    var controller:ContactController = ContactController()
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
    }
    
    @IBAction func createBtn(_ sender: Any) {
        if(firstNameFld.text != "" || lastNameFld.text != "" || mobileFld.text != ""){
            let newcontact:Contact = Contact(firstname: firstNameFld.text!, lastname: lastNameFld.text!, mobileno: mobileFld.text!)
            firstNameFld.text = ""
            lastNameFld.text = ""
            mobileFld.text = ""
            DisplayAlert(contact: newcontact)
        }
    }
    
    func DisplayAlert(contact:Contact){
        let alertview = UIAlertController(title: "Confirm?", message: "Do you want to add this contact?", preferredStyle: UIAlertController.Style.alert)
        alertview.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { _ in self.controller.AddContact(newContact: contact)}))
        alertview.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertview, animated: true, completion: nil)
    }
    
}
