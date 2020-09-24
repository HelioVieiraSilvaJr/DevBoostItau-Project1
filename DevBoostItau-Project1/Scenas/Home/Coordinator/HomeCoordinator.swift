//
//  HomeCoordinator.swift
//  DevBoostItau-Project1
//
//  Created by Matheus Pereira da Silva Souza on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAssetsList(){
        let childCoordinator = AssetsCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
    func showLogin(){
        let childCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinator.logout()
    }
    
}
