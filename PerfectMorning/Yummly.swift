//
//  Yummly.swift
//  PerfectMorning
//
//  Created by Aki on 2017-10-06.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Yummly {
    static var recipes: [Recipe] = []
    static var quickRecipes: [Recipe] = []
    static var arrangeRecipes: [Recipe] = []
    static var heighRecipes: [Recipe] = []
    static var elegantRecipes: [Recipe] = []
    
    func getAllRecipes() {
        let url = "https://api.yummly.com/v1/api/recipes"
        let maxTime = "7200"
        let course = "Breakfast"
        let query = ["_app_id": Constants.yummlyApiId, "_app_key": Constants.yummlyApiKey, "maxTotalTimeInSeconds": maxTime, "allowedCourse[]": course]
        
        Alamofire.request(url, parameters: query).responseJSON { response in
            guard let object = response.result.value else {
                                    return
                                }
            let body = JSON(object)
            for (_, recipes): (String, JSON) in body["matches"] {
                var ingredients = [String]()
                for ingredient in recipes["ingredients"].array! {
                    ingredients.append(ingredient.string!)
                }
                let word = "=s90-c"
                var img = recipes["imageUrlsBySize"]["90"].string!
                if let range = img.range(of: word) {
                        img.removeSubrange(range)
                }
                Yummly.recipes.append(Recipe(recipeName: recipes["recipeName"].string!,
                                             totalTimeInSeconds: recipes["totalTimeInSeconds"].int!,
                                             id: recipes["id"].string!,
                                             imageUrlsBySize: img,
                                             ingredients: ingredients
                                    ))
                self.separateForGenre(recipe: Yummly.recipes.last!)
            }
            print("quick : \(Yummly.quickRecipes)")
            print("arrange: \(Yummly.arrangeRecipes)")
            print("heigh: \(Yummly.heighRecipes)")
            print("elegant :\(Yummly.elegantRecipes)")
        }
    }
    
    func separateForGenre(recipe: Recipe) {
        let time = recipe.totalTimeInSeconds
        if time <= 900 {
            Yummly.quickRecipes.append(recipe)
        } else if time <= 1800 {
            Yummly.arrangeRecipes.append(recipe)
        } else if  time <= 3600 {
            Yummly.heighRecipes.append(recipe)
        } else if  time <= 7200 {
            Yummly.elegantRecipes.append(recipe)
        }
    }
}

