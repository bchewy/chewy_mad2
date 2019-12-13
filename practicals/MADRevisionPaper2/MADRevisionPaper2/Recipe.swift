//
//  Recipe.swift
//  MADRevisionPaper2
//
//  Created by Brian Chew on 3/12/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation

class Recipe{
    var name:String?
    var preparationTime:Int16?

    init(name:String, preparationTime:Int16) {
        self.name = name
        self.preparationTime = preparationTime
    }
}
