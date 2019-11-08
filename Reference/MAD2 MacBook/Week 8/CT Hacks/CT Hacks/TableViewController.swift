//
//  TableViewController.swift
//  CT Hacks
//
//  Created by MAD2 on 5/12/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation
import UIKit

/*
 Remember to set the identifier for each cell
*/
 
class TableViewController: UITableViewController {
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate // Extracting information from the appDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        // appDelegate.saveContext() // Saves to the core data
    }
    
    var globalMADStudent:[Student] = []

    func ReadData() {
        // In CT this will be put in the table
        let context = appDelegate.persistentContainer.viewContext
        do{
            let result = try context.fetch(Student.fetchRequest())
            let madStudents = result as! [Student]
            globalMADStudent = madStudents
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalMADStudent.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = globalMADStudent[indexPath.row].name
        let allModules = globalMADStudent[indexPath.row].modules?.allObjects as! [Module]
        var mString: String = ""
        for m in allModules {
            mString = mString + "\(m.name!)" + " , "
        }
        let s:String = "\(name!) takes \(mString)"
        cell.textLabel!.text = s
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
