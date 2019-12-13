//
//  ViewController.swift
//  Telefgramme
//
//  Created by Brian Chew on 5/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usrNameFld: UITextField!
    @IBOutlet weak var pwdFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginBtn(_ sender: Any) {
        
        // CT only has one storyboard but some views are not segued with each other.
        // Transition to the content story board.
        let storyboard = UIStoryboard(name: "Content", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
        // let date:Date = Date.init()
        // How to print/show date?
        // String(describing: date)
        
        // First view - retreive core data and display it somewhere
        // Second view - enter data and adds into core data
        // Third view - display as a table
    }
}

