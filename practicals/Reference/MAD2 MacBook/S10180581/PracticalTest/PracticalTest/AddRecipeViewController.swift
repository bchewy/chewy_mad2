//
//  AddRecipeViewController.swift
//  PracticalTest
//
//  Created by MAD2 on 12/12/18.
//  Copyright © 2018 MAD2. All rights reserved.
//

import Foundation
import UIKit

class AddRecipeViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPreperationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    @IBOutlet weak var txtIngredient2: UITextField!
    @IBOutlet weak var txtIngredient3: UITextField!
    @IBOutlet weak var txtIngredient4: UITextField!
    @IBOutlet weak var txtIngredient5: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnAdd(_ sender: Any) {
        if (txtTitle.text == "") || (txtPreperationTime.text == "") {
            alert(title: "Empty Field", description: "Plese populate the title and preperation time")
        }
        else {
            let ingTxt:[UITextField] = [txtIngredient1, txtIngredient2, txtIngredient3, txtIngredient4, txtIngredient5]
            var existIng:[UITextField] = []
            for ing in ingTxt {
                if ing.text != "" {
                    existIng.append(ing)
                }
            }
            if existIng.isEmpty {
                alert(title: "Empty Field", description: "Needed at least 1 ingredient.")
            }
            else {
                if addRecipe(recipeList: existIng) {
                    alert(title: "Recipe", description: "Added this recipe into the data")
                }
            }
        }
    }
    
    func alert(title: String, description: String) {
        let alert = UIAlertController(title: title,
                                      message: description, preferredStyle: UIAlertController.Style.alert)
        
        let notedAction = UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: { void in
        })
     
        alert.addAction(notedAction)
        present(alert, animated: true, completion: nil)
    }
    
    func addRecipe(recipeList: [UITextField]) -> Bool {
        let context = self.appDelegate.persistentContainer.viewContext
        let newRecipe = Recipe(context: context)
        newRecipe.name = txtTitle.text as! String
        let prepTime = txtPreperationTime.text as! String
        newRecipe.preperationTime = Int16(prepTime)!
        for ingredient in recipeList {
            let newIngredient = Ingredient(context: context)
            newIngredient.name = (ingredient.text as! String)
            newRecipe.addToIngredient(newIngredient)
        }
        self.appDelegate.saveContext()
        return true
    }
}
