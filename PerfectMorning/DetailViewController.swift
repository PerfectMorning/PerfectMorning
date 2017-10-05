//
//  DetailViewController.swift
//  PerfectMorning
//
//  Created by Julia on 2017/10/03.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: selectedRecipe.imageUrl)
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)

        titleLabel.text = selectedRecipe.title

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
