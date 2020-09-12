//
//  AddOrEditStockCoordinator.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AddOrEditStockCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func childDidFinish(_ child: Coordinator?) {
        print("Assets Coordinator deinit")
        parentCoordinator?.remove(childCoordinator: self)
    }
    
    func start() {
        let viewController = AddOrEditStockViewController()
        viewController.coordinator = self
        navigationController.present(viewController, animated: true, completion: nil)//pre(viewController, animated: true)
    }
    
    func dismissDisplay(){
        self.navigationController.dismiss(animated: true, completion: nil)
    }
}
