//
//  ShowContactViewController.swift
//  Telefgramme
//
//  Created by Brian Chew on 6/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ShowContactViewController : UITableViewController {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
        self.hideKeyboardWhenTappedAround()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    
    
    func CountData() -> Int{
        var count:Int = -1
        let controller = ContactController()
        let contacts:[Contact] = controller.retrieveAllContact()
        count = contacts.count
        return count
    }
    
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Count number of cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountData()
    }
    
    // Listing here
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let controller = ContactController()
        let contactList = controller.retrieveAllContact()
        
        let contact = contactList[indexPath.row]
        
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    // Delete here
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            let controller = ContactController()
            let contactList = controller.retrieveAllContact()
            let contact = contactList[indexPath.row]
            controller.deleteContact(mobileno: contact.mobileNo)
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = ContactController()
        let contactList = controller.retrieveAllContact()
        
        let alert = UIAlertController(title: "Edit Contact",
                                      message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter First Name"
            textField.text = contactList[indexPath.row].firstName
        }
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Last Name"
            textField.text = contactList[indexPath.row].lastName
        }
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Mobile Number"
            textField.text = contactList[indexPath.row].mobileNo
        }
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter nickname"
            textField.text = contactList[indexPath.row].nickName
        }
        
        let mobileNo = contactList[indexPath.row].mobileNo

        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { void in
            
            let textField1 = alert.textFields![0].text as String?
            let textField2 = alert.textFields![1].text as String?
            let textField3 = alert.textFields![2].text as String?
            let textField4 = alert.textFields![3].text as String?

            let contact = Contact(firstname: textField1!, lastname: textField2!, mobileno: textField3!, nickname: textField4!)
            controller.updateContact(mobileno: mobileNo, newContact: contact)
            
//            self.appDelegate.contactList[indexPath.row].firstName = textField1!
//            self.appDelegate.contactList[indexPath.row].lastName = textField2!
//            self.appDelegate.contactList[indexPath.row].mobileNo = textField3!
            
            self.tableView.reloadData()

        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        

    }
    

}
