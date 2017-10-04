//
//  MenuTableViewController.swift
//  PerfectMorning
//
//  Created by 岡田暁 on 2017-10-02.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate  {

    
    @IBOutlet var menuaTableView: UITableView!
    var genre:[String] = ["Quick", "Arrange", "Heigh", "Elegant"]

    var image: [UIImage] = [#imageLiteral(resourceName: "menu_fast"), #imageLiteral(resourceName: "menu_arrange"), #imageLiteral(resourceName: "menu_high"), #imageLiteral(resourceName: "menu_elegant")]
    var color:[UIColor] = [UIColor(red:1.00, green:0.80, blue:0.00, alpha:0.8),UIColor(red:1.00, green:0.65, blue:0.00, alpha:0.8),UIColor(red:0.92, green:0.45, blue:0.27, alpha:0.8),UIColor(red:0.95, green:0.35, blue:0.50, alpha:0.8)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"

    }
    
    func tableView(_ menuTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return genre.count
    }
    
    
    func tableView(_ menuTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let menuCell = menuTableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        menuCell.imageView?.image = image[indexPath.row]
        menuCell.imageView?.tintColor = color[indexPath.row]
        menuCell.textLabel?.text = genre[indexPath.row]

        return menuCell
    }

}
