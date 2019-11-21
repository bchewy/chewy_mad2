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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        print(String(appDelegate.contactList.count))
        
        // Create the contact object and append it into the list.
//        appDelegate.contactList.append(contact)
        let controller = ContactController()
        controller.AddContact(newContact: Contact(firstname: String(firstNameFld.text!), lastname: String(lastNameFld.text!), mobileno: String(mobileFld.text!)))

//        print("Contact Created \(contact.firstName) \(contact.lastName) \(contact.mobileNo) just printed.")

    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        // Goes back to the mainstory board
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Main") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
