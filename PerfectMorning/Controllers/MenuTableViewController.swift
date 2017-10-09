//
//  MenuTableViewController.swift
//  PerfectMorning
//
//  Created by Aki on 2017-10-02.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, menuTableViewCellDelegate  {
    @IBOutlet var menuTableView: UITableView!
    var menus: [Menu] = []
    var selectedMenu: Menu?
    var selectedPosition: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        let navHeight = (self.navigationController?.navigationBar.intrinsicContentSize.height)! + 20
        menuTableView.rowHeight = (self.view.frame.size.height - navHeight)*0.25
        menuTableView.frame = view.frame
        view.addSubview(menuTableView)
        menuTableView.dataSource = self
        menuTableView.delegate = self

        self.setMenu()
        
        // Nib for RecipeTableViewCell
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: "MenuTableCell")
    }
    
    func setMenu(){
        menus.append(Menu(title:"Quick", image: #imageLiteral(resourceName: "menu_fast"), color: Color.lemonColor))
        menus.append(Menu(title:"Arrange", image: #imageLiteral(resourceName: "menu_arrange"), color: Color.apricotColor))
        menus.append(Menu(title:"Slow", image: #imageLiteral(resourceName: "menu_high"), color: Color.valenciaColor))
        menus.append(Menu(title:"Elegant", image: #imageLiteral(resourceName: "menu_elegant"), color: Color.raspberryColor))
    }

    func tableView(_ menuTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return menus.count
    }

    func tableView(_ menuTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = menuTableView.dequeueReusableCell(withIdentifier: "MenuTableCell", for: indexPath) as! MenuTableViewCell
        // Set delegate
        menuCell.menuTableViewCellDelegate = self
        menuCell.menuTitleButton.tag = indexPath.row
        menuCell.setCell(menu: menus[indexPath.row])
        return menuCell
    }
    
    // When a button on a cell is selected 
    func onButtonTapped(position: Int) {
        // Set selected menu data
        selectedMenu = menus[position]
        
        if selectedMenu != nil {
            // Go to recipe view and pass recipe data
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "recipe") as! RecipeTableViewController
            nextView.selectedMenu = selectedMenu
            self.navigationController?.pushViewController(nextView, animated: true)
        }
    }

}
