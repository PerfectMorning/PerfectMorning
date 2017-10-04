//
//  MenuTableViewCell.swift
//  PerfectMorning
//
//  Created by 岡田暁 on 2017-10-02.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var menuColorImage: UIImageView!
    
    @IBOutlet var menuView: UIImageView!
    @IBOutlet var menuImage: UIImageView!
    @IBOutlet var menuTitle: UILabel!
    @IBOutlet var menuButton: UIButton!
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var menu: Menu?
    func setCell(menu: Menu) {
    
        self.menu = menu
        self.menuColorImage.backgroundColor = menu.color
        self.menuImage.image = menu.image
        self.menuColorImage.alpha = 0.8
        self.menuTitle.text = menu.title
        menuButton.setImage(#imageLiteral(resourceName: "arrow_right"), for: .normal)
        menuButton.tintColor = UIColor.white

    }
}
