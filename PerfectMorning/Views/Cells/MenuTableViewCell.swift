//
//  MenuTableViewCell.swift
//  PerfectMorning
//
//  Created by Aki on 2017-10-02.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

protocol menuTableViewCellDelegate: class {
    func onButtonTapped(position: Int)
}

class MenuTableViewCell: UITableViewCell {
    @IBOutlet var menuColorImage: UIImageView!
    @IBOutlet var menuView: UIImageView!
    @IBOutlet var menuImage: UIImageView!
    @IBOutlet var menuArrowButton: UIButton!
    @IBOutlet weak var menuTitleButton: UIButton!
    var menuTableViewCellDelegate: menuTableViewCellDelegate?
    var menu: Menu?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func menuTitleButton(_ sender: UIButton) {
        // Go to next view when tapped
        self.menuTableViewCellDelegate?.onButtonTapped(position: sender.tag)
    }

    func setCell(menu: Menu) {
        self.menu = menu
        self.menuColorImage.backgroundColor = menu.color
        self.menuImage.image = menu.image
        self.menuColorImage.alpha = 0.8
        self.menuTitleButton.setTitle(menu.title, for: .normal)
        self.menuTitleButton.tintColor = UIColor.white
        self.menuArrowButton.setImage(#imageLiteral(resourceName: "arrow_right"), for: .normal)
        self.menuArrowButton.tintColor = UIColor.white
    }
}
