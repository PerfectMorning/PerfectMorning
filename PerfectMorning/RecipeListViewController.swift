//
//  RecipeListViewController.swift
//  PerfectMorning
//
//  Created by 岡田暁 on 2017-09-28.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PecipeListViewController: UIViewController, UITableViewDataSource {
    var recipes: [[String: String?]] = []
    
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipe"
        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self
        getRecipe()
    }
    
    func getRecipe(){
        Alamofire.request("https://qiita.com/api/v2/items")
        .responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
            json.forEach{ (_, json) in
                let recipe: [String: String?] = [
                "title": json["title"].string,
                "userId": json["user"]["id"].string
                ]
            self.recipes.append(recipe)
            }
            self.table.reloadData()

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe["title"]!
        cell.detailTextLabel?.text = recipe["userId"]!
        return cell
    }
}
