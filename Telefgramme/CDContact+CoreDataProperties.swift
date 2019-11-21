//
//  CDContact+CoreDataProperties.swift
//  Telefgramme
//
//  Created by Brian Chew on 21/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//
//

import Foundation
import CoreData


extension CDContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDContact> {
        return NSFetchRequest<CDContact>(entityName: "CDContact")
    }

    @NSManaged public var contactno: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?

}
