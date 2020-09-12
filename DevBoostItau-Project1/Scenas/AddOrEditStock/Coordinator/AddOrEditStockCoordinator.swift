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
    var viewModel: AddOrEditStockViewModel?
    
    init(navigationController: UINavigationController, viewModel: AddOrEditStockViewModel?) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func childDidFinish(_ child: Coordinator?) {
        print("Assets Coordinator deinit")
        parentCoordinator?.remove(childCoordinator: self)
    }
    
    func start() {
        let viewController = AddOrEditStockViewController()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        navigationController.present(viewController, animated: true, completion: nil)
    }
    
    func dismissDisplay(){
        self.navigationController.dismiss(animated: true, completion: nil)
    }
}
