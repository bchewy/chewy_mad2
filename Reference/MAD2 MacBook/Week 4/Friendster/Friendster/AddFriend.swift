//
//  AddFriend.swift
//  Friendster
//
//  Created by MAD2 on 5/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//
import UIKit
class AddFriend: UIViewController {
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var addressTxtFld: UITextField!
    @IBOutlet weak var ageTxtFld: UITextField!
    @IBAction func addClick(sender: AnyObject) {
        let fren = Friend(firstname: String(nameTxtField.text!), address: String(addressTxtFld.text!), age: Int(ageTxtFld.text!)!)
        let appDeligate = UIApplication.shared.delegate as! AppDelegate
        appDeligate.friendsList.append(fren)
        print(String(appDeligate.friendsList.count))
        nameTxtField.text = ""
        addressTxtFld.text = ""
        ageTxtFld.text = ""
    }
}
