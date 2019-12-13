//
//  ViewControllerTwo.swift
//  CT Hacks (OFFICIAL)
//
//  Created by Gabriel on 7/12/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import Foundation
import UIKit

class TableControllerTwo: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate // AppDelegate Data does not require a context
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        friendsUnder20()
        print(friendsAvgAge())
    }
    
    func friendsUnder20() {
        for fren in appDelegate.friendsList {
            if fren.age < 20 {
                print(fren.firstName)
            }
        }
    }
    
    func friendsAvgAge() -> Double{
        var total:Int = 0
        for fren in appDelegate.friendsList {
            total += fren.age
        }
        return Double(total / appDelegate.friendsList.count)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.friendsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = appDelegate.friendsList[indexPath.row]
        cell.textLabel?.text = item.firstName
        cell.detailTextLabel?.text = String(item.age)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = appDelegate.friendsList[indexPath.row]
        // Alert controls
        let alert = UIAlertController(title: "Friend Information",
                                      message: "Name: \(friend.firstName) \(friend.lastName)", preferredStyle: UIAlertController.Style.alert) // Creating the alert message
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in }) // The buttons created for the alert
        
        alert.addAction(cancelAction) // Adding the action
        self.present(alert, animated: true, completion: nil) // Displaying the alert
    }
}
