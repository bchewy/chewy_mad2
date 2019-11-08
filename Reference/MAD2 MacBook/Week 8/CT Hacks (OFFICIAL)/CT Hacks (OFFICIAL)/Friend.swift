//
//  Friend.swift
//  CT Hacks (OFFICIAL)
//
//  Created by Gabriel on 7/12/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

import Foundation

// Creating the class constructor
class Friend {
    var firstName:String = ""
    var lastName:String = ""
    var age:Int = 0
    
    var description:String = ""
    
    init (firstname:String, lastname:String, age:Int) {
        self.firstName = firstname
        self.lastName = lastname
        self.age = age
    }
}
