//
//  CDMessage+CoreDataProperties.swift
//  Telegramme
//
//  Created by MAD2_P03 on 21/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//
//

import Foundation
import CoreData


extension CDMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMessage> {
        return NSFetchRequest<CDMessage>(entityName: "CDMessage")
    }

    @NSManaged public var date: String?
    @NSManaged public var isSender: Bool
    @NSManaged public var text: String?
    @NSManaged public var friend: CDFriend?

}
