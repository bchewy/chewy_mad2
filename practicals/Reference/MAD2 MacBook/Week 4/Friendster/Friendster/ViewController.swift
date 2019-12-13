//
//  ViewController.swift
//  Friendster
//
//  Created by MAD2 on 5/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usrNameFld: UITextField!
    @IBOutlet weak var pwdFld: UITextField!
    @IBAction func onClick (sender: AnyObject)
    {
        let storyboard = UIStoryboard(name: "AppStoryBoard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AppView") as UIViewController
        present(vc, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

