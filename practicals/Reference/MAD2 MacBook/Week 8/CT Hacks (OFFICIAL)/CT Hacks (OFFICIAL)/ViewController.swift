//
//  ViewController.swift
//  CT Hacks (OFFICIAL)
//
//  Created by Gabriel on 7/12/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var txtText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // An action that runs when the button is pressed
    @IBAction func btnChange(_ sender: UIButton) {
        var text: String
        text = txtText.text!
        lblText.text = text
    }
    
    // Opens up the second table view
    // Second button which opens the appDelegate list
    @IBAction func btnNewView(_ sender: Any) {
        // Accessing another view programically
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "newStoryboard") as UIViewController // The identifier allows the view to be accessed
        present(vc, animated: true, completion: nil)
    }
}

