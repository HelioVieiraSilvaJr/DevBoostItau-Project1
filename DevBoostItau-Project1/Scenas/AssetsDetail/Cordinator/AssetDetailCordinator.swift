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
    var viewModel: AssetsDetailViewModel!

    init(navigationController: UINavigationController, viewModel: AssetsDetailViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        let viewController = AssetsDetailViewController()
        viewController.cordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
//        navigationController.present(viewController, animated: true, completion: nil)
    }
}
