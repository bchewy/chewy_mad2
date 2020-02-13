//
//  ContactController.swift
//  Telegramme
//
//  Created by MAD2_P03 on 19/11/19.
//  Copyright © 2019 MAD2_P03. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ContactController {
    //add new Contact into coreData
    func AddContact(newContact: Contact){
        //Need these 3 lines to add the object into table
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDContact", in: context)!
        
        let contact = NSManagedObject(entity: entity, insertInto: context)
        contact.setValue(newContact.firstName, forKey: "firstname")
        contact.setValue(newContact.lastName, forKey: "lastname")
        contact.setValue(newContact.mobileNo, forKey: "mobileno")
        
        do{
            try context.save()
        }
        catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
    }
    
    //Retreive all contacts from CoreData
    func retrieveAllContact()->[Contact]{
        var contacts:[NSManagedObject] = []
        var contactList:[Contact] = []
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        do{
            contacts = try context.fetch(fetchRequest)
            
            for c in contacts{
                let firstname = c.value(forKeyPath: "firstname") as? String
                let lastname = c.value(forKeyPath: "lastname") as? String
                let mobileno = c.value(forKeyPath: "mobileno") as? String
                //print("\(firstname!), \(lastname!), \(mobileno!)")
                let newContact:Contact = Contact(firstname: firstname!, lastname: lastname!, mobileno: mobileno!)
                contactList.append(newContact)
            }
        }
        catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return contactList
    }
    
    //Update contact and fetching data based on mobileno
    func updateContact(mobileno:String, newContact:Contact){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno= %@", mobileno)
        
        do{
            let test = try! context.fetch(fetchRequest)
            let objectToUpdate = test[0]
            objectToUpdate.setValue(newContact.firstName, forKeyPath: "firstname")
            objectToUpdate.setValue(newContact.lastName, forKeyPath: "lastname")
            objectToUpdate.setValue(newContact.mobileNo, forKeyPath: "mobileno")
            
            do{
                try context.save()
            }
            catch let error as NSError{
                print("Could not update. \(error), \(error.userInfo)")
            }
        }
    }
    
    //Delete contact and fetching data based on mobileno
    func deleteContact(mobileno:String){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDContact")
        fetchRequest.predicate = NSPredicate(format: "mobileno= %@", mobileno)
        
        do{
            let test = try context.fetch(fetchRequest)
            let objectToDelete = test[0]
            context.delete(objectToDelete)
            do{
                try context.save()
            }
            catch let error as NSError{
                print("Could not delete. \(error), \(error.userInfo)")
            }
        }
        catch let error as NSError{
            print("Could not find using mobileno. \(error), \(error.userInfo)")
        }
        
    }
}
