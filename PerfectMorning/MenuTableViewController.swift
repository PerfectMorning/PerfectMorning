//
//  MenuTableViewController.swift
//  PerfectMorning
//
//  Created by Aki on 2017-10-02.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet var menuTableView: UITableView!
  
    var menues: [Menu] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        menuTableView.rowHeight = 150
        menuTableView.frame = view.frame
        view.addSubview(menuTableView)
        menuTableView.dataSource = self
        menuTableView.delegate = self
        self.setMenu()
        
        // Nib for RecipeTableViewCell
        let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
        menuTableView.register(nib, forCellReuseIdentifier: "MenuTableCell")
        
        goToRecipeList(item: selectedMenu)
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
    
    var selectedMenu: Menu?
    // When a cell is selected
    func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {

        if selectedMenu != nil {
            performSegue(withIdentifier: "toRecipeTableViewController",sender: nil)
        }
    }
    
    // Prepare Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toRecipeTableViewController") {
            let nextVC = (segue.destination as? RecipeTableViewController)!
            nextVC.selectedMenu = selectedMenu
        }
    }
    
    func goToRecipeList(item: Menu?) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "recipe") as! RecipeTableViewController
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}
