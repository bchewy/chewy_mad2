//
//  ViewController.swift
//  Practical 3
//
//  Created by MAD2 on 31/10/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        txtField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var myLbl: UILabel!
    @IBAction func onClick(_ sender: UIButton) {
        myLbl.text? = "Button has been clicked"
        print("I'm Clicked!")
    }
    @IBOutlet weak var txtField: UITextField!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        myLbl.text = textField.text
        return true
    }
}

