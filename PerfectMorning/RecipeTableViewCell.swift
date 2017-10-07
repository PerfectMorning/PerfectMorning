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
        self.recipe = recipe;
        // Use image URL to call recipe image
        let url = URL(string: recipe.imageUrlsBySize)
        let data = try? Data(contentsOf: url!)
        let image = UIImage(data: data!)

        let screenWidth = UIScreen.main.bounds.size.width
        recipeImageView.image = cropImage(image: image!, w: Int(screenWidth), h: Int(screenWidth * 0.8))
        
        // Style: Corner radius
        recipeImageView.layer.cornerRadius = 10
        recipeImageView.clipsToBounds = true
    
        // Title
        recipeTitleLavel.text = self.recipe?.recipeName
        likeLabel.text = "0 Likes"
        favoriteLabel.text = "💛"
    }
    
    func cropImage(image :UIImage, w:Int, h:Int) -> UIImage {
        // Resize the image
        let origRef    = image.cgImage
        let origWidth  = Int(origRef!.width)
        let origHeight = Int(origRef!.height)
        var resizeWidth:Int = 0
        var resizeHeight:Int = 0
        
        if (origWidth < origHeight) {
            resizeWidth = w
            resizeHeight = origHeight * resizeWidth / origWidth
        } else {
            resizeHeight = h
            resizeWidth = origWidth * resizeHeight / origHeight
        }
        
        let resizeSize = CGSize.init(width: CGFloat(resizeWidth), height: CGFloat(resizeHeight))
        UIGraphicsBeginImageContext(resizeSize)
        image.draw(in: CGRect.init(x: 0, y: 0, width: CGFloat(resizeWidth), height: CGFloat(resizeHeight)))
        
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Crop the image from the center
        let cropRect  = CGRect.init(x: CGFloat((resizeWidth - w) / 2), y: CGFloat((resizeHeight - h) / 2), width: CGFloat(w), height: CGFloat(h))
        let cropRef   = resizeImage!.cgImage!.cropping(to: cropRect)
        let cropImage = UIImage(cgImage: cropRef!)
        
        return cropImage
    }
}
