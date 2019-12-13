//
//  Friend.swift
//  Friendster
//
//  Created by MAD2 on 7/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation

class Friend {
    var firstName:String = ""
    var address:String = ""
    var age:Int = 0
    
    var description: String = ""
    
    init(firstname:String, address:String, age:Int) {
        self.firstName = firstname
        self.address = address
        self.age = age
    }
}

