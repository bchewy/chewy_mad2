//
//  TableController.swift
//  CT Hacks (OFFICIAL)
//
//  Created by Gabriel on 7/12/18.
//  Copyright © 2018 Gabriel. All rights reserved.
//

/* ACCESSING CORE DATA */
import Foundation
import UIKit

class TableController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var mods:[ModuleGrp] = [] // List to populate for the table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ReadData()
    }
    
    func ReadData() {
        let context = appDelegate.persistentContainer.viewContext // Required for Core Data
        // Error Handling (REQUIRED)
        do {
            let result = try context.fetch(ModuleGrp.fetchRequest()) // Retrieving the data
            mods = result as! [ModuleGrp] // Converting the datatype of the data
        } catch {
            print("Error lol")
        }
    }
    
    // Declaring the sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Declaring the size of the list
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mods.count
    }
    
    // The Displaying the data of each individual cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Display the module with the students
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // choosing the cell to display the information
        
        let allStudents = mods[indexPath.row].students?.allObjects as! [Student] // Student data from the module groups
        var mString: String = ""
        for m in allStudents {
            mString = mString + "\(m.name!)" + " , "
        }
        
        cell.textLabel!.text = mString // String for students
        
        let module = mods[indexPath.row].modGroup // Module Group Data
        cell.detailTextLabel!.text = module // String for module group
        
        return cell
    }
    
    // Action whem a row is selscted
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    @IBAction func addPerson(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Student",
                                      message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name" }
        
        alert.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Age" }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { void in
            let textField1 = alert.textFields![0].text as! String
            let textField2 = alert.textFields![1].text as! String
            self.addPerson(name: textField1, age: textField2)
            self.ReadData()
            self.tableView.reloadData()
            })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
                (action : UIAlertAction!) -> Void in })
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        present(alert, animated: true, completion: nil)
    }
    
    func addPerson(name: String, age: String) {
        let context = self.appDelegate.persistentContainer.viewContext
        let newStudent = Student(context: context)
        newStudent.name = name
        newStudent.age = Int16(age)!
        ReadData()
        for mod in mods {
            if mod.modGroup == "T02" {
                mod.addToStudents(newStudent)
            }
        }
        self.appDelegate.saveContext()
    }
}
