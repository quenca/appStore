//
//  ViewController.swift
//  AppStore
//
//  Created by User02 on 28/08/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class FeatureAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var appCategories: [AppCategory]? 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appCategories = AppCategory.sampleAppCategories()
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }

}


