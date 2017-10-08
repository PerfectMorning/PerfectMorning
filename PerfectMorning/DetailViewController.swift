//
//  DetailViewController.swift
//  PerfectMorning
//
//  Created by Julia on 2017/10/03.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cooktimeLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var overviewButton: UIButton!
    @IBOutlet weak var ingredButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!

    var selectedRecipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: selectedRecipe.imageUrlsBySize)
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)
            
        titleLabel.text = selectedRecipe.recipeName
    }
}
