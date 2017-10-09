//
//  DetailViewController.swift
//  PerfectMorning
//
//  Created by Julia on 2017/10/03.
//  Copyright © 2017 Aki

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cooktimeLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var buttonGroupStack: UIStackView!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var ingredButton: UIButton!
    @IBOutlet weak var descHeaderLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var selectedRecipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.main.bounds.size.width
        
        
        // Recipe imageView
        let url = URL(string: selectedRecipe.imageUrlsBySize)
        let data = try? Data(contentsOf: url!)
        imageView.image = Helpers.cropImage(image: UIImage(data: data!)!, w: Int(screenWidth), h: Int(screenWidth * 0.8))
        imageView.frame.size.height = screenWidth*0.8
        imageView.frame.size.width = screenWidth
        imageView.frame.origin.x = 0
        
        imageView.sizeToFit()
        
        // Fav button
        favButton.frame.origin.x = screenWidth - 80
        favButton.frame.origin.y = Helpers.getY(frame: imageView.frame) + 20
        favButton.frame.size.width = 60
        favButton.frame.size.height = 60
        let favIcon = UIImage(named: "fav_heart")?.withRenderingMode(.alwaysTemplate)
        favButton.setImage(favIcon, for: .normal)
        favButton.tintColor = Color.lemonColor
        
        // Recipe title label
        titleLabel.frame.origin.x = 20
        titleLabel.frame.origin.y = Helpers.getY(frame: imageView.frame) + 20
        titleLabel.frame.size.width = favButton.frame.origin.x - 30
        titleLabel.numberOfLines = 0
        titleLabel.text = selectedRecipe.recipeName
        titleLabel.sizeToFit()
        
        // Recipe cooktime label
        cooktimeLabel.frame.origin.x = 20
        cooktimeLabel.frame.origin.y = Helpers.getY(frame: titleLabel.frame) + 10
        cooktimeLabel.text = "\(selectedRecipe.totalTimeInSeconds / 60) mins"
        cooktimeLabel.sizeToFit()
        
        // Button group stack view
        buttonGroupStack.frame.origin.x = 20
        buttonGroupStack.frame.origin.y = Helpers.getY(frame: cooktimeLabel.frame) + 20
        
        // Recipe overview button
        overviewButton.frame.origin.x = 20
        overviewButton.frame.origin.y = Helpers.getY(frame: buttonGroupStack.frame)
        overviewButton.frame.size.width = screenWidth / 2 - 5
        overviewButton.sizeToFit()
        
        // Recipe ingredients button
        ingredButton.frame.origin.x = screenWidth / 2 + 5
        ingredButton.frame.origin.y = Helpers.getY(frame: buttonGroupStack.frame)
        ingredButton.sizeToFit()
        
        // Recipe description header label
        descHeaderLabel.frame.origin.x = 20
        descHeaderLabel.frame.origin.y = Helpers.getY(frame: buttonGroupStack.frame) + 10
        descHeaderLabel.frame.size.width = screenWidth - 20
        descHeaderLabel.numberOfLines = 0
        descHeaderLabel.text = "Ingredients"
        descHeaderLabel.sizeToFit()
        
        // Recipe description label
        descriptionLabel.frame.origin.x = 20
        descriptionLabel.frame.origin.y = Helpers.getY(frame: descHeaderLabel.frame) + 5
        descriptionLabel.frame.size.width = screenWidth - 20
        descriptionLabel.numberOfLines = 0
        showIngredients(label: descriptionLabel, data: selectedRecipe.ingredients)
        descriptionLabel.sizeToFit()
    }

    private func showIngredients(label: UILabel, data: [String]) {
        for d in data {
            label.text?.append("    \(d)\n")
        }
    }
    
    private func showOverview() {
    }
}
