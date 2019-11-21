//
//  AddContactViewController.swift
//  Telefgramme
//
//  Created by Brian Chew on 5/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation

import UIKit

class AddContactViewController : UIViewController {
    
    @IBOutlet weak var firstNameFld: UITextField!
    @IBOutlet weak var lastNameFld: UITextField!
    @IBOutlet weak var mobileFld: UITextField!
    @IBOutlet weak var nickFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

    }
    
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(appDelegate.contactList.count))
        
        // Create the contact object and append it into the list.
//        appDelegate.contactList.append(contact)
        let controller = ContactController()
        controller.AddContact(newContact: Contact(firstname: String(firstNameFld.text!), lastname: String(lastNameFld.text!), mobileno: String(mobileFld.text!), nickname: String(nickFld.text!)))
        
        let alert = UIAlertController(title: "Contact Created",
                                      message: "Your new contact of \(String(firstNameFld.text!)) has been created successfully.", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        clearText()
//        print("Contact Created \(contact.firstName) \(contact.lastName) \(contact.mobileNo) just printed.")

    }
    
    func clearText(){
        firstNameFld.text = ""
        lastNameFld.text = ""
        mobileFld.text = ""
        nickFld.text = ""
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        // Goes back to the mainstory board
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Main") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
}
