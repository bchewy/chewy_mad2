//
//  Contact.swift
//  Telefgramme
//
//  Created by Brian Chew on 5/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation

class Contact{
    var firstName:String
    var lastName:String
    var mobileNo:String
    var nickName:String
    
    init(firstname:String, lastname:String, mobileno:String, nickname:String) {
        firstName = firstname
        lastName = lastname
        mobileNo = mobileno
        nickName = nickname
    }
}
