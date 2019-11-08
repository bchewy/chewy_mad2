//
//  ViewController.swift
//  CT Hacks
//
//  Created by MAD2 on 5/12/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate // Extracting information from the appDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CreateData()
        ReadData()
    }
    func CreateData() {
        let context = appDelegate.persistentContainer.viewContext
        let mad1 = Module(context: context)
        mad1.name = "Mobile App Development 1"
        let mad2 = Module(context: context)
        mad2.name = "Mobile App Development 2"

        let lucas = Student(context: context)
        lucas.name = "Lucas"
        lucas.addToModules(mad1)
        lucas.addToModules(mad2) // mad1.addToStudent(lucas) also works the same
        // lucas.addToModules(mad1, mad2)
        
        let joel = Student(context: context)
        joel.name = "Joel"
        joel.addToModules(mad2)
        
        
        //appDelegate.saveContext() // Saves to the core data
    }
    func ReadData() {
        // In CT this will be put in the table
        let context = appDelegate.persistentContainer.viewContext
        do{
            let result = try context.fetch(Student.fetchRequest())
            let madStudents = result as! [Student]
            for oneStudent in madStudents {
                print(oneStudent.name)
                let allModules = oneStudent.modules?.allObjects as! [Module]
                for mod in allModules {
                    print(mod.name)
                }
            }
        } catch {
            print("Error lol")
        }
        
    }
}

