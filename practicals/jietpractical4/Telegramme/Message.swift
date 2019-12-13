//
//  Message.swift
//  Telegramme
//
//  Created by MAD2_P03 on 25/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation

class Message {
    var Date:Date
    var IsSender:Bool
    var Text:String
    
    init(date:Date, issender:Bool, text:String) {
        Date = date
        IsSender = issender
        Text = text
        
    }
    
    
}
