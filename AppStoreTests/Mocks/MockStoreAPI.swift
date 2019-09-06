//
//  MockStoreAPI.swift
//  AppStoreTests
//
//  Created by User02 on 05/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import Foundation
@testable import AppStore

class MockStoreAPI {
    var shouldReturnError = false
    static var requestWasCalled = false
    var requestReviewsWasCalled = false
    
    enum MockServiceError: Error {
        case login
        case requestReviews
    }
    
    func reset() {
        shouldReturnError = false
        MockStoreAPI.requestWasCalled = false
        requestReviewsWasCalled = false
    }
    
    convenience init() {
        self.init(false)
    }
    
    lazy var app = App(imageName: "dine", id: 0, name: "Dine - More Dates, Not Swipes", category: "Social Networking", price: 3.99)
    lazy var array: [App] = [app]
    
    
    let category = AppCategory(name: "Best New Apps", apps: [App(imageName: "dine", id: 0, name: "Dine - More Dates, Not Swipes", category: "Social Networking", price: 3.99)], type: "")
    
    let featureApps = FeaturedApps(bannerCategory: AppCategory(name: "Best New Apps", apps: [App(imageName: "dine", id: 0, name: "Dine - More Dates, Not Swipes", category: "Social Networking", price: 3.99)], type: ""), appCategories: [AppCategory(name: "Best New Apps", apps: [App(imageName: "dine", id: 0, name: "Dine - More Dates, Not Swipes", category: "Social Networking", price: 3.99)], type: "")])
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
}

extension MockStoreAPI: AppsApiProtocol {
    func fetchJson(completionHandler: @escaping (FeaturedApps?, Error?) -> Void) {
        MockStoreAPI.requestWasCalled = true
        
        if shouldReturnError {
            completionHandler(nil, MockServiceError.requestReviews)
        } else {
            completionHandler(featureApps, nil)
        }
    }
}
