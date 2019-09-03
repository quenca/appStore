//
//  View.swift
//  AppStore
//
//  Created by User02 on 02/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

protocol View {
    static func instantiate() -> self
}

extension View where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        
        let className = fullName.components(separatedBy: ".")[1]
        
        let layout = UICollectionViewFlowLayout()
        let featureAppsController = FeatureAppsController(collectionViewLayout: layout)
        
        return featureAppsController.instantiateViewController(withIdentifier: className) as! Self
    }
}
