//
//  AppsApiProtocol.swift
//  AppStore
//
//  Created by User02 on 05/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import Foundation

protocol AppsApiProtocol {
    func fetchJson(completionHandler: @escaping (FeaturedApps?, Error?) -> Void)
}
