//
//  CDContact+CoreDataProperties.swift
//  Telegramme
//
//  Created by MAD2_P03 on 21/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//
//

import Foundation
import CoreData


extension CDContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDContact> {
        return NSFetchRequest<CDContact>(entityName: "CDContact")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var mobileno: String?

}
