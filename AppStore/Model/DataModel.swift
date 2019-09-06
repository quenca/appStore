//
//  Services.swift
//  AppStore
//
//  Created by User02 on 06/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import Foundation

class DataModel: AppsApiProtocol {
    
    func fetchJson(completionHandler: @escaping (FeaturedApps?, Error?) -> Void) {
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
