//
//  FriendController.swift
//  Telegramme
//
//  Created by MAD2_P03 on 22/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FriendController {
    func AddFriend(friend:Friend){
        //Need these 3 lines to add the object into table
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
        
        let newfriend = NSManagedObject(entity: entity, insertInto: context)
        newfriend.setValue(friend.Name, forKey: "name")
        newfriend.setValue(friend.ProfileImageName, forKey: "profileImageName")
        
        do{
            try context.save()
        }
        catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func AddMessageToFriend(friend:Friend, message:Message) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //Get the Message table
        let Messageentity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
        //Create a new Message entity row with its values
        let newMessage = NSManagedObject(entity: Messageentity, insertInto: context)
        newMessage.setValue(message.Date, forKey: "date")
        newMessage.setValue(message.IsSender, forKey: "issender")
        newMessage.setValue(message.Text, forKey: "text")
        
        //Fetch Friend table to fetch a row
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        //Fetch the row in Friend table where name is equal to friend.Name
        fetchRequest.predicate = NSPredicate(format: "name= %@", friend.Name)
        
        do{
            //Fetch the list of results from the query
            let test = try! context.fetch(fetchRequest)
            //Get the first result of the list
            let newFriend = test[0]
            //Create a new Friend object in relation to the Message entity
            newMessage.setValue(newFriend, forKey: "friend")
            try context.save()
        }
        catch{
            print(error)
        }
        
        
    }
    
    func retrieveMessagesbyFriend(friend:Friend) -> [Message] {
        var messageList:[Message] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //Get Message table
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDMessage")
        //Get Message table based on Friend
        fetchRequest.predicate = NSPredicate(format: "friend.name= %@", friend.Name)
        
        do{
            //Get rows in Message table
            let message = try context.fetch(fetchRequest)
            
            for m in message{
                let Date = m.value(forKeyPath: "date") as? Date
                let Issender = m.value(forKeyPath: "issender") as? Bool
                let Text = m.value(forKeyPath: "text") as? String
                print("\(Date!), \(Issender!), \(Text!)")
                //Add into the message list
                messageList.append(Message(date: Date!, issender: Issender!, text: Text!))
                
            }
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return messageList
        
    }
}
