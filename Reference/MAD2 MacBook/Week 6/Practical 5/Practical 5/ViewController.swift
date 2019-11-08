//
//  ViewController.swift
//  Practical 5
//
//  Created by MAD2 on 21/11/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
    var Actors: [Character] = []
    
    @IBAction func AddButton(_ sender: Any) {
        Alert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if CountData() > 0 {
            GetData()
        }
        
    }
    func CountData()->Int {
        var count:Int = -1
        let context = appDelegate.persistentContainer.viewContext
        do {
            let result = try context.fetch(Character.fetchRequest())
            let characters = result as! [Character]
            count = characters.count
        }
        catch {
            print("Data Error")
        }
        return count
    }
    func GetData() {
        let context = appDelegate.persistentContainer.viewContext
        do {
            let result = try context.fetch(Character.fetchRequest())
            Actors = result as! [Character]
        } catch {
            print("Data error")
        }
    }
    func AddData(name: String) {
        let context = appDelegate.persistentContainer.viewContext
        let actor = Character(context: context)
        actor.name = name
        appDelegate.saveContext()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Actors.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Actors[indexPath.row].name
        return cell
    }
    func Alert() {
        let alert = UIAlertController(title: "Add Character", message: "Please add only characters in GOT", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default,
                                       handler: {(action: UIAlertAction) -> Void in
                                        let textField = alert.textFields!.first
                                        if textField?.text != "" {
                                        self.AddData(name: textField!.text!)
                                        self.GetData()
                                        self.tableView.reloadData()
                                        }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {(action: UIAlertAction) -> Void in})
        
        alert.addTextField{
            (textField: UITextField) -> Void in
            textField.placeholder = "Enter Name"
        }
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        present(alert, animated: true, completion: nil)
    }
}
