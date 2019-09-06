//
//  LargeCategoryCell.swift
//  AppStore
//
//  Created by User02 on 06/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

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
        }
    }
}
