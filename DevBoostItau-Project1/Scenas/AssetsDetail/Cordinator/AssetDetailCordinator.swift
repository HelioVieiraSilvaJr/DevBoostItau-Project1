//
//  AssetDetailCordinator.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetDetailCordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var asset: AssetModel!

    init(navigationController: UINavigationController, asset: AssetModel) {
        self.navigationController = navigationController
        self.asset = asset
    }
    
    func start() {
        let viewController = UIStoryboard(name: "AssetsDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "AssetsDetailViewController") as! AssetsDetailViewController
        viewController.cordinator = self
        viewController.asset = asset
        navigationController.pushViewController(viewController, animated: false)
    }
}
