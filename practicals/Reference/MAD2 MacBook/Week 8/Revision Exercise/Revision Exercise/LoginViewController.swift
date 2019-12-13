//
//  LoginViewController.swift
//  Revision Exercise
//
//  Created by MAD2 on 3/12/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation
import UIKit
class LoginViewController: UIViewController {
    
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnLogin(_ sender: Any) {
        let inputEmail: String = txtEmail.text!
        let inputPassword: String = txtPassword.text!
        
        // Verification
        if (AccountExists(email: inputEmail, password: inputPassword)) {
            // Control to allow the current view to chenge to the Identifier
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "grnavcontroller")
                present(vc!, animated: false, completion: nil)
        }
        else {
            print("Wrong input")
        }
    }
    
    // Checking with the CoreData
    func AccountExists(email: String, password: String) -> Bool {
        var status:Bool = false
        do {
            // Access AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let result = try context.fetch(Account.fetchRequest())
            
            let accounts = result as! [Account]
            
            // Compare the accounts
            for account in accounts {
                if (email == account.email) && (password == account.password) {
                 status = true
                }
            }
        } catch {
            print("Data Error")
        }
        return status
    }
}
