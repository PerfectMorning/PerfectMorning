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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cooktimeLabel: UILabel!
    @IBOutlet weak var fabButton: UIButton!
    var recipe: Recipe?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(recipe: Recipe) {
        self.recipe = recipe
        
        let screenWidth = UIScreen.main.bounds.size.width

        
        // Recipe image view
        recipeImageView.frame.origin.x = 20
        recipeImageView.frame.origin.y = 20
        let url = URL(string: recipe.imageUrlsBySize)
        let data = try? Data(contentsOf: url!)
        recipeImageView.image = Helpers.cropImage(image: UIImage(data: data!)!, w: Int(screenWidth - 40), h: Int(screenWidth - 40))
        Helpers.addCornerRadius(imageView: recipeImageView, radius: 10)
        recipeImageView.sizeToFit()
    
        // Fav button
        fabButton.frame.origin.x = screenWidth - 68
        fabButton.frame.origin.y = Helpers.getY(frame: recipeImageView.frame) + 10
        fabButton.frame.size.width = 48
        fabButton.frame.size.height = 48
        let favIcon = UIImage(named: "fav_heart")?.withRenderingMode(.alwaysTemplate)
        fabButton.setImage(favIcon, for: .normal)
        fabButton.tintColor = Color.lemonColor
    
        // Recipe title label
        titleLabel.frame.origin.x = 20
        titleLabel.frame.origin.y = Helpers.getY(frame: recipeImageView.frame) + 10
        titleLabel.frame.size.width = fabButton.frame.origin.x - 30
        titleLabel.numberOfLines = 0
        titleLabel.text = self.recipe?.recipeName
        titleLabel.sizeToFit()
        
        // Recipe cooktime label
        cooktimeLabel.frame.origin.x = 20
        cooktimeLabel.frame.origin.y = Helpers.getY(frame: titleLabel.frame) + 10
        cooktimeLabel.text = "\(recipe.totalTimeInSeconds / 60) mins"
        cooktimeLabel.sizeToFit()
    }
}
