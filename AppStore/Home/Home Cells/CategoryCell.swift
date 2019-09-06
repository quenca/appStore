//
//  CategoryCell.swift
//  AppStore
//
//  Created by User02 on 28/08/19.
//  Copyright © 2019 User02. All rights reserved.
//
import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var featureAppsController: FeatureAppsController?
    
    var appCategory: AppCategory? {
        didSet {
            if let name = appCategory?.name {
                nameLabel.text = name
            }
            appsCollectionView.reloadData()
        }
    }
    
    private let cellId = "appCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.isHighlighted = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setupViews() {
        addSubview(appsCollectionView)
        addSubview(dividerLineView)
        addSubview(nameLabel)
        
        appsCollectionView.dataSource = self
        appsCollectionView.delegate = self
        
        appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
       // nameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        
        
        appsCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        appsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  //      appsCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
  //      appsCollectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        appsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        appsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        dividerLineView.topAnchor.constraint(equalTo: appsCollectionView.bottomAnchor, constant: 10).isActive = true
        dividerLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        dividerLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true 
     //   dividerLineView.widthAnchor.constraint(equalTo: appsCollectionView.widthAnchor).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        backgroundColor = .clear
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategory?.apps?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppCell
        cell.app = appCategory?.apps?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height - 32)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appCategory?.apps?[indexPath.item] {
        featureAppsController?.showAppDetailForApp(app: app)
        }
    }
    
}

class AppCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let name = app?.name {
                nameLabel.text = name
            }
            
            if let category = app?.category {
                categoryLabel.text = category
            }
            
            if let price = app?.price {
                priceLabel.text = "$\(price)"
            } else {
                priceLabel.text = "Free"
            }
           
            if let imageName = app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Frozen"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Entertainment"
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$3.99"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()
    
    let stackAppView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.axis = .vertical
        return stackView
    }()
    
    let stackLabels: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.alignment = .leading 
        stackView.axis = .vertical
        return stackView
    }()
    
    func setupViews() {
        addSubview(stackAppView)
        
        stackAppView.addArrangedSubview(imageView)
        stackAppView.addArrangedSubview(stackLabels)
        
        stackLabels.addArrangedSubview(nameLabel)
        stackLabels.addArrangedSubview(categoryLabel)
        stackLabels.addArrangedSubview(priceLabel)
        
        stackAppView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        stackAppView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5).isActive = true
        stackAppView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        stackAppView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5).isActive = true
        
        stackLabels.widthAnchor.constraint(equalTo: stackAppView.widthAnchor).isActive = true
        //stackLabels.setContentCompressionPriority(.required, for: .vertical)
        //stackLabels.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        //stackLabels.setContentHuggingPriority(., for: <#T##NSLayoutConstraint.Axis#>)
        //stackLabels.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
        
        imageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
}
