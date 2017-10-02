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


class RecipeListViewController: UIViewController, UITableViewDataSource {
    var recipes: [[String: String?]] = []
    let table = UITableView()
    let API_KEY = "780eeade7ac75ece204662710ba0a2c0"
    let constants = Bundle.main.path(forResource: "Constants/Constants", ofType: "swift")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipe"
        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self        
        getRecipe()
    }
    
    func getRecipe(){
        Alamofire.request("http://food2fork.com/api/search?key=\(API_KEY)&q=shredded%20chicken")
        .responseJSON { response in
            guard let object = response.result.value else {
                return
            }
            let json = JSON(object)
        
            for (_,subJson) in json["recipes"] {
                let recipe: [String: String?] = [
                "title": subJson["title"].string,
                "publisher": subJson["publisher"].string,
                "image_url":subJson["image_url"].string
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
        cell.detailTextLabel?.text = recipe["publisher"]!
        let data = try? Data(contentsOf: URL(string:(recipe["image_url"]!)!)!)
        let image: UIImage = UIImage(data: data!)!
        cell.imageView?.image = image
        return cell
    }
}
