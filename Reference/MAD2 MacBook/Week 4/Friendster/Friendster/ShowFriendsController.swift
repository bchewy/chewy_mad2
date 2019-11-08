//
//  ShowFriendsController.swift
//  Friendster
//
//  Created by MAD2 on 7/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation
import UIKit
class ShowFriendsController: UITableViewController {
    var appDelegate = AppDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.reloadData() // Refreash data
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.friendsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        let f = appDelegate.friendsList[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = f.firstName
        cell.detailTextLabel?.text = f.address
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Edit Friend",
                                      message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name" }
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Address" }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { void in
            let textField1 = alert.textFields![0].text as String?
            let textField2 = alert.textFields![1].text as String?
            self.appDelegate.friendsList[indexPath.row].firstName = textField1!
            self.appDelegate.friendsList[indexPath.row].address = textField2!

        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            appDelegate.friendsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath],
                                 with: UITableView.RowAnimation.fade)
        }
    }
}

