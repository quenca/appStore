//
//  Model.swift
//  AppStore
//
//  Created by User02 on 29/08/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

struct FeaturedApps: Decodable {
    let bannerCategory: AppCategory?
    let appCategories: [AppCategory]?
    enum CodingKeys: String, CodingKey {
        case bannerCategory
        case appCategories = "categories"
    }
    
    static func fetchJson(completionHandler: @escaping (FeaturedApps?, Error?) -> Void) {
        let url = "https://api.letsbuildthatapp.com/appstore/featured"
        URLSession.shared.dataTask(with: URL(string:url)!) { data, _, error in
            guard let data = data, error == nil else {
                completionHandler(nil, error)
                return
            }
            do {
                let json = try JSONDecoder().decode(FeaturedApps.self, from: data)
                completionHandler(json, nil)
            } catch let jsonError {
                completionHandler(nil, jsonError)
            }
            }.resume()
    }
}

struct AppCategory: Decodable{
    let name: String?
    let apps: [App]?
    let type: String?
}

struct App: Decodable {
    var imageName: String?
    var id: Int?
    var name: String?
    var category: String?
    var price: Double?
    enum CodingKeys: String, CodingKey {
        case imageName = "ImageName"
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case price = "Price"
    }
}

/*
class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    var type: String?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "apps" {
            apps = [App]()
            for dict in value as! [[String: AnyObject]] {
                let app = App()
                app.setValuesForKeys(dict)
                apps?.append(app)
            }
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchFeatureApps(completionHandler: @escaping ([AppCategory]) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) -> Void in
            
            if error != nil {
                print(error)
                return
            }
            do {
                
                let json = try (JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: AnyObject])
            
                var appCategories = [AppCategory]()
                
                for dict in json["categories"] as! [[String: AnyObject]] {
                    let appCategory = AppCategory()
                    appCategory.setValuesForKeys(dict["Name"] as! [String : AnyObject])
                   // appCategory.mutableSetValue(forKey: dict["Name"] as! String)
                 //   appCategory.mutableSetValue(forKey: dict["category"] as? String ?? "")
                 //   appCategory.mutableSetValue(forKey: dict["imageName"] as? String ?? "")
                 //   appCategory.mutableSetValue(forKey: dict["price"] as? String ?? "")
                    appCategories.append(appCategory)
                }
                
                print(appCategories)
                DispatchQueue.main.async {
                    completionHandler(appCategories)
                }
                
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    static func sampleAppCategories() -> [AppCategory] {
        
        // Category
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Apps"
        
        // Frozen App
        var apps = [App]()
        
        let frozenApp = App()
        frozenApp.name = "Disney Build It: Frozen"
        frozenApp.imageName = "frozen"
        frozenApp.category = "Entertainment"
        frozenApp.price = NSNumber(floatLiteral: 3.99)
        
        apps.append(frozenApp)
        bestNewAppsCategory.apps = apps
        
        // Category
        let bestNewGamesCategory = AppCategory()
        bestNewAppsCategory.name = "Best New Games"
        
        // Telepaint App
        var bestNewGameApps = [App]()
        
        let telepaintApp = App()
        telepaintApp.name = "Telepaint"
        telepaintApp.category = "Games"
        telepaintApp.imageName = "telepaint"
        telepaintApp.price = NSNumber(floatLiteral: 2.99)
        
        bestNewGameApps.append(telepaintApp)
        bestNewGamesCategory.apps = bestNewGameApps

        return [bestNewAppsCategory, bestNewGamesCategory]
    }
}

class App: NSObject {
    
    var id: NSNumber?
    var name: String?
    var category: String?
    var imageName: String?
    var price: NSNumber?
}
*/


