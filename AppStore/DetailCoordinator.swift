//
//  DetailCoordinator .swift
//  AppStore
//
//  Created by User02 on 02/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class DetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    private var app: App
    
    init(navigationController: UINavigationController,
         app: App) {
        self.navigationController = navigationController
        self.app = app
    }
    
    func start() {
        let layout = UICollectionViewFlowLayout()
        let controller = AppDetailController(collectionViewLayout: layout)
        controller.app = app
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
}
