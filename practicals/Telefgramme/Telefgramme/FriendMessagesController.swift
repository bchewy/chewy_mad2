//
//  FriendMessagesController.swift
//  Telefgramme
//
//  Created by Brian Chew on 22/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation
import UIKit

// This is the friend messages view controller
class FriendMessagesController : UIViewController {
    
    @IBOutlet weak var messagesField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
