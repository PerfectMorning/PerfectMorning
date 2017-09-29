//
//  Food2Fork.swift
//  PerfectMorning
//
//  Created by Julia on 2017/09/28.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import UIKit
import Alamofire

class Food2Fork {
    
    static func searchRecipe() {
        // HTTP request to food2fork API
        Alamofire.request(
        "http://food2fork.com/api/search?key=\(Constants.food2ForkApiKey)&q=shredded%20chicken"
        ).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
        
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
        
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }

}
