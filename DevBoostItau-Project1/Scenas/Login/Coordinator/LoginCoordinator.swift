//
//  LoginCoordinator.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/23/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func logout(){
        let vc = LoginViewController()
        vc.coordinator = self
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        navigationController.popToRootViewController(animated: true)
    }
    
    func showHome(){
        let childCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinator.parentCoordinator = self
        add(childCoordinator: childCoordinator)
        childCoordinator.start()
    }
    
}

