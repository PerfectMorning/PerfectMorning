//
//  RecipeTableViewController.swift
//  PerfectMorning
//
//  Created by Aki on 2017-09-28.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecipeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var mainTableView: UITableView!
    var recipes = Yummly.recipes
    var quickRecipes  = Yummly.quickRecipes
    var arrangeRecipes = Yummly.arrangeRecipes
    var heighRecipes = Yummly.heighRecipes
    var elegantRecipes = Yummly.elegantRecipes
    var yummly = Yummly()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipe"

        mainTableView.rowHeight = 350
        mainTableView.frame = view.frame
        view.addSubview(mainTableView)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        // Nib for RecipeTableViewCell
        let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        mainTableView.register(nib, forCellReuseIdentifier: "RecipeTableViewCell")
        
        getRecipes()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Display custom cell
        let recipeCell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as! RecipeTableViewCell
        recipeCell.update(recipe: recipes[indexPath.row])
        return recipeCell
    }
    
    var selectedRecipe: Recipe?

    // When a cell is selected
    func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(recipes[indexPath.row])

        // Search and set recipeData from [indexPath.row]
        selectedRecipe = Recipe(recipeName: recipes[indexPath.row].recipeName,
                                totalTimeInSeconds: recipes[indexPath.row].totalTimeInSeconds,
                                id: recipes[indexPath.row].id,
                                imageUrlsBySize: recipes[indexPath.row].imageUrlsBySize,
                                ingredients: recipes[indexPath.row].ingredients
        )
        if selectedRecipe != nil {
            // Call segue to go to DetailViewController
            performSegue(withIdentifier: "toDetailViewController",sender: nil)
        }
    }
    
    // Prepare Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toDetailViewController") {
            let nextVC = (segue.destination as? DetailViewController)!
            // Set recipeData in DetailViewController
            nextVC.selectedRecipe = selectedRecipe
        }
    }

    func getRecipes() {
        yummly.getAllRecipes()
   
        self.mainTableView.reloadData()
        
    }

}
