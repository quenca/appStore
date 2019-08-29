//
//  Model.swift
//  AppStore
//
//  Created by User02 on 29/08/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    
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
