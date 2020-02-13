//
//  ViewController.swift
//  Telegramme
//
//  Created by MAD2_P03 on 5/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func usrNameFld(_ sender: Any) {
    }
    
    @IBAction func pwdFld(_ sender: Any) {
    }
    
    
    @IBAction func onClick(_ sender: Any) {
        if true {
            let storyboard = UIStoryboard(name: "Content", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Content") as UIViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}

