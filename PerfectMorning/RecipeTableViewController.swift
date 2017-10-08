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
    var recipes = [Recipe]()
    var yummly = Yummly()
    var selectedRecipe: Recipe?
    var selectedMenu: Menu!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

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

    // When a cell is selected
    func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Search and set recipeData from [indexPath.row]

        selectedRecipe = Recipe(recipeName: recipes[indexPath.row].recipeName,
                                totalTimeInSeconds: recipes[indexPath.row].totalTimeInSeconds,
                                id: recipes[indexPath.row].id,
                                imageUrlsBySize: recipes[indexPath.row].imageUrlsBySize,
                                ingredients: recipes[indexPath.row].ingredients
        )
        selectedRecipe = recipes[indexPath.row]
        if selectedRecipe != nil {
            // Go to detail view and pass recipe data
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "detail") as! DetailViewController
            nextView.selectedRecipe = selectedRecipe
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
    }
    func getRecipes() {
        yummly.getAllRecipes()
        title = selectedMenu.title
        switch title {
            case "Quick"?:
            recipes = Yummly.quickRecipes
            case "Arrange"?:
                recipes = Yummly.arrangeRecipes
            case "High"?:
                recipes = Yummly.heighRecipes
            case "Elegant"?:
                recipes = Yummly.elegantRecipes
            default:
                recipes = []
        }
        self.mainTableView.reloadData()
    }
}
