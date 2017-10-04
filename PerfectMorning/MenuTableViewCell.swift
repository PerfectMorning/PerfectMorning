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
        //        self.menuView.image = darken(image: menu.image)
        self.menuColorImage.backgroundColor = menu.color
        self.menuImage.image = menu.image
        
//        menuView.backgroundColor = UIColor.clear
        menuColorImage.alpha = 0.8
        self.menuTitle.text = menu.title

        
        
//        .withRenderingMode(.alwaysTemplate)
//        self.menuView.tintColor = menu.color
        
//        self.menuView.alpha = 0.2
//        self.menuImage.backgroundColor = menu.color
        menuButton.setImage(#imageLiteral(resourceName: "arrow_right"), for: .normal)
        menuButton.tintColor = UIColor.white

    }
    
//    func darken(image:UIImage) -> UIImage{
    
        // 一時的な暗くするようの黒レイヤ
//        let frame = CGRect(origin:CGPoint(x:0,y:0),size:image.size)
//        let tempView = UIView(frame:frame)
//        tempView.backgroundColor = menu?.color
//        tempView.alpha = 0.8
        
       
        // 画像を新しいコンテキストに描画する
//        UIGraphicsBeginImageContext(frame.size)
//        let context = UIGraphicsGetCurrentContext()
//        alphaImage.draw(in: frame)
//
        
        
        // コンテキストに黒レイヤを乗せてレンダー
//        context!.translateBy(x: 0, y: frame.size.height)
//        context!.scaleBy(x: 1.0, y: -1.0)
//        context!.clip(to: frame, mask: image.cgImage!)
//        tempView.layer.render(in: context!)
//
//        let imageRef = context!.makeImage()
//        let toReturn = UIImage(cgImage:imageRef!)
//        UIGraphicsEndImageContext()
//        return toReturn
//
//    }
    
}
