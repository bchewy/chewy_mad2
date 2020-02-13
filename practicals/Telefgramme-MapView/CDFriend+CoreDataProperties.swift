//
//  CDFriend+CoreDataProperties.swift
//  Telegramme
//
//  Created by MAD2_P03 on 21/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//
//

import Foundation
import CoreData


extension CDFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFriend> {
        return NSFetchRequest<CDFriend>(entityName: "CDFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var profileImageName: String?
    @NSManaged public var lastMessage: CDMessage?
    @NSManaged public var messages: CDMessage?

}
