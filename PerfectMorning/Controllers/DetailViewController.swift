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
    @IBOutlet weak var descriptionLabel: UILabel!

    var selectedRecipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenWidth = UIScreen.main.bounds.size.width
        
        // Recipe imageView
        let url = URL(string: selectedRecipe.imageUrlsBySize)
        let data = try? Data(contentsOf: url!)
        imageView.image = Helpers.cropImage(image: UIImage(data: data!)!, w: Int(screenWidth), h: Int(screenWidth * 0.8))
        
        // Fav button
        favButton.frame.origin.x = screenWidth - 80
        favButton.frame.origin.y = Helpers.getY(frame: imageView.frame) - 44
        
        // Recipe title label
        titleLabel.frame.origin.x = 20
        titleLabel.frame.origin.y = Helpers.getY(frame: imageView.frame) - 44
        titleLabel.frame.size.width = favButton.frame.origin.x - 30
        titleLabel.numberOfLines = 0
        titleLabel.text = selectedRecipe.recipeName
        titleLabel.sizeToFit()
        
        // Recipe cooktime label
        cooktimeLabel.frame.origin.x = 20
        cooktimeLabel.frame.origin.y = Helpers.getY(frame: titleLabel.frame) + 10
        cooktimeLabel.text = String(selectedRecipe.totalTimeInSeconds)
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
        
        // Recipe discription label
        descriptionLabel.frame.origin.x = 20
        descriptionLabel.frame.origin.y = Helpers.getY(frame: buttonGroupStack.frame) + 10
        descriptionLabel.frame.size.width = screenWidth - 20
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "TODO: \nget descriptions from data"
        descriptionLabel.sizeToFit()
    }

}
