//
//  AssetsCoordinator.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/12/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetsCoordinator: Coordinator {
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
        let viewController = AssetsViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func editInvestment(){
//           let childCoordinator = AddOrEditStockCoordinator(navigationController: navigationController)
//           childCoordinator.parentCoordinator = self
//           add(childCoodinator: childCoordinator)
//           childCoordinator.start()
       }
       
       func showInvestment(viewModel: AssetsDetailViewModel){
            let childCoordinator = AssetDetailCordinator(navigationController: navigationController, viewModel: viewModel)
            childCoordinator.parentCoordinator = self
            add(childCoordinator: childCoordinator)
            childCoordinator.start()
       }
    
}
