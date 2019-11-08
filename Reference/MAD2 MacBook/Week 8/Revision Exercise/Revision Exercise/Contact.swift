//
//  Contact.swift
//  Revision Exercise
//
//  Created by Gabriel on 4/12/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation // What's the foundation for?
import UIKit

// Creating a Contact object
class Contact {
    
    var firstName: String = ""
    var lastName: String = ""
    
    var photo: UIImage
    var telephone: String
    
    init(firstname: String, lastname: String, img: UIImage, hp:String) {
        self.firstName = firstname
        self.lastName = lastname
        self.photo = img
        self.telephone = hp
    }
    
}
