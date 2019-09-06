//
//  MainCoordinator.swift
//  AppStore
//
//  Created by User02 on 02/09/19.
//  Copyright © 2019 User02. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let model = DataModel()
        let featureAppsController = FeatureAppsController(featuresApp: model)
        navigationController.pushViewController(featureAppsController, animated: true)
    }
    
    func appDetail(app: App) {
        let child = DetailCoordinator(navigationController: navigationController, app: app)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let detailViewController = fromViewController as? AppDetailController {
            childDidFinish(detailViewController.coordinator)
        }
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
