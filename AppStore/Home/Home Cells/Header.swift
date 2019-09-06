//
//  Header.swift
//  AppStore
//
//  Created by User02 on 06/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class Header: CategoryCell {
    private let bannerCellId = "bannerCellId"
    let bannerCell = BannerCell()
    
    override func setupViews() {
        //super.setupViews()
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        appsCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: bannerCellId)
        
        addSubview(appsCollectionView)
        appsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        appsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        appsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCellId, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 32)
    }
}

