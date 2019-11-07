//
//  ViewController.swift
//  Practical3
//
//  Created by Brian Chew on 28/10/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
    }

    @IBOutlet weak var txtField: UITextField!
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtField.resignFirstResponder()
        myLbl.text = txtField.text
        return true
    }
    
    @IBAction func onClick(_ sender: Any) {
        myLbl.text = "Button has been clickd!"
        print("Button has been clickd!")
    }
    
}

