//
//  AppCoordinator.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init() {
        navigationController = UINavigationController()
        setupNavigationBar()
    }
    
    func setupNavigationBar(){
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.tintColor = .white
        navigationController.view.backgroundColor = .clear
    }
    
    func start() {
        let childCoordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
}
