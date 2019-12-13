//
//  AddRecipeViewController.swift
//  MADRevisionPaper2
//
//  Created by Brian Chew on 3/12/19.
//  Copyright © 2019 Brian Chew. All rights reserved.
//

import Foundation
import UIKit

class AddRecipeViewController : UIViewController
{
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    
    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblTemporary: UILabel!
    let recipeController:RecipeController = RecipeController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Reloads the view any time it is segued back to, also works when the view is first loaded initially
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        lblDateTime.text = ShowDateTime(dateInput: Date.init())
        AppDelegate.temp += 5
        lblTemporary.text! += String(AppDelegate.temp) // Loading global variable
    }
    
    
    @IBAction func btnAdd(_ sender: Any)
    {
        // Integer field cannot be broken;
        let recipe:Recipe = Recipe(name: txtTitle.text!, preparationTime: Int16(txtPreparationTime.text!)!)
        
        let ingredient1:Ingredient = Ingredient(name: txtIngredient1.text!)
        let ingredient2:Ingredient = Ingredient(name: txtIngredient2.text!)
        let ingredient3:Ingredient = Ingredient(name: txtIngredient3.text!)
        let ingredient4:Ingredient = Ingredient(name: txtIngredient4.text!)
        let ingredient5:Ingredient = Ingredient(name: txtIngredient5.text!)

        
        recipeController.AddRecipe(recipe: recipe)
        recipeController.AddIngredientToRecipe(recipe: recipe, ingredient: ingredient1)
        recipeController.AddIngredientToRecipe(recipe: recipe, ingredient: ingredient2)
        recipeController.AddIngredientToRecipe(recipe: recipe, ingredient: ingredient3)
        recipeController.AddIngredientToRecipe(recipe: recipe, ingredient: ingredient4)
        recipeController.AddIngredientToRecipe(recipe: recipe, ingredient: ingredient5)
        
        Alert(title: "Recipe with ingredients has been added.", message: "Your recipe has been added with the ingredients you have specified.")
        
        // Make sure the ViewController has tableVC as storyboardID in the storyboard viewer.
        MoveToTableVC(storyboardName: "Main", vcIdentifier: "TableVC")
        
    }
    
    
    func Alert(title:String, message:String)
    {
        let alert = UIAlertController(title: title,
                                      message: message, preferredStyle: UIAlertController.Style.alert)
        
        // Prints out an action - handler defines what exactly can be within like running a function or etc.
        // let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
            self.txtIngredient1.text = "abc"
            // Adding values to core data.
        })

        alert.addAction(okAction)
        
        // Make sure your present only exists once.
        //self.present(alert, animated: true, completion: nil)
    }

    // Moves to a view controller based on the parsed storyboard name and the viewcontroller storyboard identifier.
    func MoveToTableVC(storyboardName:String, vcIdentifier:String)
    {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcIdentifier) as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    // Format and show datetime as a string
    func ShowDateTime(dateInput: Date)->String
    {
        let date = dateInput
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yyyy" //Change according to how you want to format
        return dateFormatterPrint.string(from: date)
    }
}
