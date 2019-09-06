//
//  BannerCell.swift
//  AppStore
//
//  Created by User02 on 06/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class BannerCell: AppCell {
    
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
        imageView.layer.cornerRadius = 0
        
        stackLargeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        stackLargeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        stackLargeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        stackLargeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        imageView.widthAnchor.constraint(equalTo: stackLargeImageView.widthAnchor)
        imageView.heightAnchor.constraint(equalTo: stackLargeImageView.heightAnchor)
    }
}

