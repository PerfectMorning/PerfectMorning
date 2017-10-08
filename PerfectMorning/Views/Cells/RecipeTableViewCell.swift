//
//  RecipeTableViewCell.swift
//  PerfectMorning
//
//  Created by Julia on 2017/09/30.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeTitleLavel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    var recipe: Recipe?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(recipe: Recipe) {
        self.recipe = recipe

        // Use image URL to call recipe image
        let url = URL(string: recipe.imageUrlsBySize)
        let data = try? Data(contentsOf: url!)
        let image = UIImage(data: data!)

        let screenWidth = UIScreen.main.bounds.size.width
        recipeImageView.image = Helpers.cropImage(image: image!, w: Int(screenWidth), h: Int(screenWidth * 0.8))
        Helpers.addCornerRadius(imageView: recipeImageView, radius: 10)
    
        // Title
        recipeTitleLavel.text = self.recipe?.recipeName
        likeLabel.text = "0 Likes"
        favoriteLabel.text = "💛"
    }

}
