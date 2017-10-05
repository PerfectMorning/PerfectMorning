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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    var recipe: Recipe?
    
    func update(recipe: Recipe) {
        self.recipe = recipe;

        // Use image URL to call recipe image
        let url = URL(string: recipe.imageUrl)
        let data = try? Data(contentsOf: url!)
        recipeImageView.image = UIImage(data: data!)
        
        recipeTitleLavel.text = self.recipe?.title
        likeLabel.text = "0 Likes"
        favoriteLabel.text = "💛"
    }

}
