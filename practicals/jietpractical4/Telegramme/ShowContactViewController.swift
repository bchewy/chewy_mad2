//
//  ShowContactViewController.swift
//  Telegramme
//
//  Created by MAD2_P03 on 7/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation
import UIKit



class ShowContactViewController : UITableViewController{
    
    var contactController:ContactController = ContactController()
    var contactList:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
//        contactList = contactController.retrieveAllContact()
    }
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        contactList = contactController.retrieveAllContact()
        //To Reload the tableview when a list item is added
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let contact = contactList[indexPath.row]
        cell.textLabel!.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel!.text = "\(contact.mobileNo)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            contactList.remove(at: indexPath.row) //need to remove the item in the list first because when the UI of the row is deleted first, the indexPath will be gone
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appDelegate.rowValue = indexPath.row
    }
}
