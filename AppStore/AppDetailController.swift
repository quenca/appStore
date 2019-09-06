//
//  AppDetailController.swift
//  AppStore
//
//  Created by User02 on 02/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class AppDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    weak var coordinator: DetailCoordinator?

    var app: App? {
        didSet {
            navigationItem.title = app?.name
        }
    }
    
     var appHeader: AppDetailHeader?
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView.register(AppDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeader
        
        header.imageView.image = UIImage(named: app!.imageName!)
        
        if let price = app?.price?.description {
             header.buyButton.setTitle("$\(price)", for: .normal)
        } else {
            header.buyButton.setTitle("Free", for: .normal)
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
}

class AppDetailHeader: BaseCell {
    
    weak var coordinator: DetailCoordinator?
    
    var app: App? {
        didSet {
            if let imageName =  app?.imageName {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true 
        return image
    }()
    
    let segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Detail", "Reviews", "Related"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buyButton: UIButton = {
       let button = UIButton(type: .system)
         button.translatesAutoresizingMaskIntoConstraints = false
       button.setTitle("Buy", for: .normal)
       button.layer.borderColor = UIColor(displayP3Red: 0, green: 129/255, blue: 250/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
       return button
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupViews() {
        
        addSubview(imageView)
        addSubview(segmentedControl)
        addSubview(nameLabel)
        addSubview(buyButton)
        addSubview(dividerLineView)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 14).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        segmentedControl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 110).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        buyButton.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -20).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dividerLineView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50).isActive = true
        dividerLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        dividerLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive =  true
        
        super.setupViews()
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
    
}
