//
//  RecipeTableViewController.swift
//  PracticalTest
//
//  Created by MAD2 on 12/12/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation
import UIKit

class RecipeTableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var allRecipes: [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        ReadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func ReadData() {
        let context = appDelegate.persistentContainer.viewContext
        do {
            let result = try context.fetch(Recipe.fetchRequest())
            allRecipes = result as! [Recipe]
            tableView.reloadData()
        } catch {
            print("Error fetching data")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRecipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Display the module with the students
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellRecipe = allRecipes[indexPath.row]
        let string1 = "\(cellRecipe.name!) (\(cellRecipe.preperationTime)mins)"
        cell.textLabel!.text = string1
        let cellIngredients: [Ingredient] = cellRecipe.ingredient?.allObjects as! [Ingredient]
        var string2 = "Ingredients: "
        for ing in cellIngredients {
            string2 = string2 + "[\(ing.name!)] "
        }
        cell.detailTextLabel!.text = string2 // String for module group
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination as! AddRecipeViewController).isMovingToParent {
            ReadData()
            
        }
        if (segue.destination as! AddRecipeViewController).isBeingDismissed {
            ReadData()
        }
        // Idk how to reload the data
    }
}
