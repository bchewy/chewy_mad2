//
//  Friend.swift
//  Practical2
//
//  Created by MAD2 on 22/10/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation

class Friend {
    var firstName:String = ""
    var lastName:String = ""
    var age:Int = 0
    
    var descreption: String = ""
    
    init(firstname:String, lastname:String, age:Int) {
        self.firstName = firstname
        self.lastName = lastname
        self.age = age
    }
}
