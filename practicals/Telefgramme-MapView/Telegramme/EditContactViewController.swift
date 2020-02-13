//
//  EditContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P03 on 14/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation
import UIKit



class EditContactViewController : UIViewController{
    
    var contactcontroller:ContactController = ContactController()
    var contactList:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactList = contactcontroller.retrieveAllContact()
    }
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var txtFirstname: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    
    @IBAction func btnSave(_ sender: Any) {
        let rowValue = appDelegate.rowValue
        let contact = contactList[rowValue!]
        if(txtFirstname.text != nil && txtLastname.text != nil && txtMobile.text != nil){
            alertView(contact: contact)
            //contactcontroller.updateContact(mobileno: contact.mobileNo, newContact: Contact(firstname: //txtFirstname.text!, lastname: txtLastname.text!, mobileno: txtMobile.text!))
        }
        
    }
    func alertView(contact:Contact){
        let alertview = UIAlertController(title: "Confirm?", message: "Do you want to change this contact?", preferredStyle: UIAlertController.Style.alert)
        alertview.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler:
            { _ in self.contactcontroller.updateContact(mobileno: contact.mobileNo, newContact: Contact(firstname: self.txtFirstname.text!, lastname: self.txtLastname.text!, mobileno: self.txtMobile.text!))}))
        alertview.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertview, animated: true, completion: nil)
    }
    
}
