//
//  Friend.swift
//  Practical2
//
//  Created by Brian Chew on 22/10/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation

class Friend{
    var firstname:String = ""
    var lastname:String = ""
    var age:Int = 0
    var description:String = ""
    
    init(firstname:String, lastname:String, age:Int){
        self.firstname = firstname
        self.lastname = lastname
        self.age = age
    }
}
