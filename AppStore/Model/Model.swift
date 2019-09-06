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
}

struct AppCategory: Decodable{
    let name: String?
    let apps: [App]?
    let type: String?
}

class App: Decodable {
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
    
    init(imageName: String, id: Int, name: String, category: String, price: Double) {
        self.imageName = imageName
        self.id = id
        self.name = name
        self.category = category
        self.price = price 
    }
}
