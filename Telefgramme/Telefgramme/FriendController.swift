//
//  FriendController.swift
//  Telefgramme
//
//  Created by Brian Chew on 21/11/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class FriendController {
    
    func AddFriend(friend:Friend)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "CDFriend", in: context)!
        let newfriend = NSManagedObject(entity: entity, insertInto: context)
        newfriend.setValue(friend.Name,forKeyPath:"name")
        newfriend.setValue(friend.profileImageName, forKey: "profileimagename")
        
        do{
            try context.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    // Insert a new message for a friend
    func AddMessageToFriend(friend: Friend, message:Message)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
         let entity = NSEntityDescription.entity(forEntityName: "CDMessage", in: context)!
         let newMessage = NSManagedObject(entity: entity, insertInto: context)
        newMessage.setValue(message.Date, forKey: "date")
        newMessage.setValue(message.isSender, forKey: "isSender")
        newMessage.setValue(message.Text, forKey: "text")
        
        
    let friendFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDFriend")
        friendFetchRequest.predicate = NSPredicate(format: "name = %@", friend.Name)
        do{
            let friends = try context.fetch(friendFetchRequest)
            let foundFriend = friends[0]
            newMessage.setValue(foundFriend, forKey: "friend")
        }
        catch{
            print(error)
        }
    
        
        

    }
    
    // Retrieve the messages from your friend
    func RetrieveMessagesByFriend(friend: Friend)->[Message]
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var messageList:[Message] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDMessage")
        // fetches all the messages for that friend
            fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.Name)

            
            do{
                let msgs = try context.fetch(fetchRequest)
                for m in msgs{
                    let datey = m.value(forKeyPath: "date") as! Date
                    let sendy = m.value(forKeyPath: "isSender") as! Bool
                    let texty = m.value(forKeyPath: "text") as! String
                    messageList.append(Message(date: datey, issender: sendy, text: texty))

                    
                }
                
            }
            catch{
                print(error)
            }
        return messageList
    }
    
}
