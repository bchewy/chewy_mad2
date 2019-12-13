//
//  RecipeTableViewController.swift
//  MADRevisionPaper2
//
//  Created by Brian Chew on 3/12/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation
import UIKit

class RecipeTableViewController : UITableViewController
{
    var recipeList:[Recipe] = []
    var ingredientList:[Ingredient] = []

    let recipeController:RecipeController = RecipeController()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        recipeList = recipeController.RetrieveRecipe()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Loads here since it will also retrieve & reload after segueing back from add viewcontroller
        recipeList = recipeController.RetrieveRecipe()
        tableView.reloadData()
    }
    
    // Table view controller - you need these methods for the table
    // Number of sections

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count
    }
    
    // What should go into each singular cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        ingredientList = recipeController.RetrieveIngredients(recipe: recipeList[indexPath.row])
        
        var s:String = ""
        for ing in ingredientList
        {
            NSLog("Ingredient Nmae \(ing.name!)")
            s += ing.name! + ","
        }
        

        cell.textLabel!.text = recipeList[indexPath.row].name!
        cell.detailTextLabel!.text = s
        
        return cell
    }
    
    // -----
}
