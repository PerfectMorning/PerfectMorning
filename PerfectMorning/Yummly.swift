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
        let url = "http://api.yummly.com/v1/api/recipes?_app_id=\(Constants.yummlyApiId)&_app_key=\(Constants.yummlyApiKey)"
        let keyword = "&allowedCourse[]=course^course-Breakfast&maxTotalTimeInSeconds=7200&maxResult=100&start=100"
        
        Alamofire.request(url + keyword)
            .responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                
                let body = JSON(object)
                
                for (_, recipes): (String, JSON) in body["matches"] {
                    Yummly.recipes.append(Recipe(recipeName: recipes["recipeName"].string!,
                                          totalTimeInSeconds: recipes["totalTimeInSeconds"].int!,
                                          id: recipes["id"].string!,
                                          imageUrlsBySize: recipes["imageUrlsBySize"].string!,
                                          ingredients: [recipes["ingredients"].string!]
                        
                    ))
                    self.separateForGenre(recipe: Yummly.recipes.last!)
                    
                }
                
            
        }
    }
    
    func separateForGenre(recipe: Recipe){
        let time = recipe.totalTimeInSeconds
        if time <= 900{
            Yummly.quickRecipes.append(recipe)
        }else if time > 900 && time <= 1800{
            Yummly.arrangeRecipes.append(recipe)
        }else if time > 1800 && time <= 3600{
            Yummly.heighRecipes.append(recipe)
        }else if time > 3600 && time <= 7200{
            Yummly.elegantRecipes.append(recipe)
        }
    }
}

