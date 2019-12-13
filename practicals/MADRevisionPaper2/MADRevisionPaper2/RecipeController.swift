//
//  RecipeController.swift
//  MADRevisionPaper2
//
//  Created by Brian Chew on 3/12/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RecipeController
{
    func AddRecipe(recipe: Recipe)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)

        
         // One way of doing it
        let cdRecipe = NSManagedObject(entity: entity!, insertInto: context)
        cdRecipe.setValue(recipe.name, forKey: "name")
        cdRecipe.setValue(recipe.preparationTime, forKey: "preparationTime")
        
        // A second way of doing it
//        let cdRecipe = NSManagedObject(entity: entity!, insertInto: context) as! CDRecipe
//        cdRecipe.name = recipe.name
//        cdRecipe.preparationTime = recipe.preparationTime!
        
        
        appDelegate.saveContext()
        
    }
    
    func AddIngredientToRecipe(recipe: Recipe,ingredient: Ingredient)
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Fetch the ingredents, if any!
        let fetchIngredentRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        fetchIngredentRequest.predicate = NSPredicate(format: "name = %@", ingredient.name!)
        
        do {
            // Fetch the ingredient
            let cdIngredient = try context.fetch(fetchIngredentRequest)
            
            // Fetch the recipe
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
            fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name!)
            
            let cdRecipe = try context.fetch(fetchRequest)
            let tempRecipe = cdRecipe[0] as! CDRecipe
            
            // Check if ingredient exists and then just reuse, otherwise add new one
            if cdIngredient.count > 0
            {
                let foundIngredient = cdIngredient[0] as! CDIngredient
                foundIngredient.addToRecipes(tempRecipe) // Make the association one way
            }
            else
            {
                // If ingredent is not found, insert it
                let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)!
                let CDIngredient = NSManagedObject(entity: entity, insertInto: context) as! CDIngredient
                // Add the ingredient by setting core data ingredient to the ingredient name
                CDIngredient.name = ingredient.name
                CDIngredient.addToRecipes(tempRecipe)
            }
            // Save the context for the app delegate.
            appDelegate.saveContext()
            
        }
        catch{}

    }
    
    // Retrieve the recipes
    func RetrieveRecipe()->[Recipe]
    {
        var recipes:[Recipe] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // Retrieve the entity
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDRecipe")
        do
        {
            let cdRecipe = try context.fetch(fetchRequest) as! [CDRecipe]
            for rec in cdRecipe
            {
                // Add to the list and return
                recipes.append(Recipe(name: rec.name!, preparationTime: rec.preparationTime))
            }
        }
        catch{ print(error) }
        
        return recipes
    }
    
    // Retrieve the ingredients for that particular recipe
    func RetrieveIngredients(recipe: Recipe)->[Ingredient]
    {
        var ingredients:[Ingredient] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CDIngredient")
        
        // Fetch the recipe that is for this ingredient.
        // As long as one of it is the same
        fetchRequest.predicate = NSPredicate(format: "ANY recipes.name = %@", recipe.name!)
        
        do
        {
            let cdIngredient = try context.fetch(fetchRequest) as! [CDIngredient]
            for ing in cdIngredient
            {
                // Add to the list and return
                ingredients.append(Ingredient(name: ing.name!))
            }
        }
        catch{ print(error) }

        
        print("Printing ingredents List: \(ingredients)")
        return ingredients
    }

    
    
}
