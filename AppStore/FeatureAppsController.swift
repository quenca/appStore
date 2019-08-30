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
    private let largeCellId = "largeCellId"
    
    var appCategories: [AppCategory]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // appCategories = AppCategory.sampleAppCategories()
        FeaturedApps.fetchJson { apps, error in
            guard let apps = apps, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            
            self.appCategories = apps.appCategories
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
            print(apps)
        }
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCellId)
        
        collectionView.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeCellId, for: indexPath) as! LargeCategoryCell
            cell.appCategory = appCategories?[indexPath.item]
            
            return cell
        }
        
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

        if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 160)
        }
        return CGSize(width: view.frame.width, height: 230)
    }
}

class LargeCategoryCell: CategoryCell {
    
    private let largeAppCellId = "largeAppCellId"
    
    override func setupViews() {
        super.setupViews()
        appsCollectionView.register(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: largeAppCellId, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 32)
    }
    
    private class LargeAppCell: AppCell {
        
        let stackLargeImageView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.distribution = .fillProportionally
            stackView.spacing = 0
            stackView.alignment = .center
            stackView.axis = .vertical
            return stackView
        }()
        
         override func setupViews() {
             addSubview(stackLargeImageView)
            
            stackLargeImageView.addArrangedSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
           
            stackLargeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
            stackLargeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
            stackLargeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
            stackLargeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5).isActive = true
            
            imageView.widthAnchor.constraint(equalTo: stackLargeImageView.widthAnchor)
            imageView.heightAnchor.constraint(equalTo: stackLargeImageView.heightAnchor)
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-2-[v0]-14-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": imageView]))
        }
    }
}


