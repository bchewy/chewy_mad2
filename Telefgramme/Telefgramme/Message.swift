//
//  Message.swift
//  Telefgramme
//
//  Created by Brian Chew on 21/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation

class Message {
    var Date:Date
    var isSender:Bool
    var Text:String
    
    init(date:Date, issender:Bool, text:String) {
        Date = date
        isSender = issender
        Text = text
    }
}
