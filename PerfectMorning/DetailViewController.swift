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
    
//    private let headerHeight: CGFloat = 300
//    var headerImageView = imageView

    var selectedRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize and set headerView
//        detailView.addSubview(headerView)
//
//        detailView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
//        detailView.contentOffset = CGPoint(x: 0, y: -headerHeight)
//        updateHeaderView()

        let url = URL(string: selectedRecipe.imageUrl)
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)

        titleLabel.text = selectedRecipe.title

    }
    
//    override func scrollViewDidScroll(scrollView: UIScrollView) {
//        updateHeaderView()
//    }
//
//    private func updateHeaderView() {
//        detailView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, buttom: 0, right: 0)
//        var headerRect = CGRect(x: 0, y: -headerHeight, width: imageView.bounds.width, height: headerHeight)
//
//        if detailView.contentOffset.y < -headerHeight {
//            headerRect.origin.y = detailView.contentOffset.y
//            headerRect.size.height = -detailView.contentOffset.y
//        }
//        headerView.frame = headerRect
//    }
}
