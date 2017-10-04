//
//  MenuTableViewController.swift
//  PerfectMorning
//
//  Created by 岡田暁 on 2017-10-02.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate  {

    
    
    @IBOutlet var menuTableView: UITableView!
  
    var menues: [Menu] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        menuTableView.rowHeight = 150
        menuTableView.frame = view.frame
        view.addSubview(menuTableView)
        menuTableView.dataSource = self
        self.setMenu()
        
        // Nib for RecipeTableViewCell
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: "MenuTableCell")

    }
    
    func setMenu(){
        menues.append(Menu(title:"Fast", image: #imageLiteral(resourceName: "menu_fast"), color: UIColor(red:1.00, green:0.80, blue:0.00, alpha:1.0)))
        menues.append(Menu(title:"Arrange", image: #imageLiteral(resourceName: "menu_arrange"), color: UIColor(red:1.00, green:0.65, blue:0.00, alpha:1.0)))
        menues.append(Menu(title:"Heigh", image: #imageLiteral(resourceName: "menu_high"), color: UIColor(red:0.92, green:0.45, blue:0.27, alpha:1.0)))
        menues.append(Menu(title:"Elegant", image: #imageLiteral(resourceName: "menu_elegant"), color: UIColor(red:0.95, green:0.35, blue:0.50, alpha:1.0)))
    }
    func tableView(_ menuTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menues.count
    }
    
    
    func tableView(_ menuTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let menuCell = menuTableView.dequeueReusableCell(withIdentifier: "MenuTableCell", for: indexPath) as! MenuTableViewCell
        
        menuCell.setCell(menu: menues[indexPath.row])


        return menuCell
    }

}
