//
//  Coordinator.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit
import CoreData

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController {get set}
    var childCoordinators: [Coordinator] {get set}
    var parentCoordinator: Coordinator? {get set}
    
    func start()
    func add(childCoordinator coordinator: Coordinator)
    func remove(childCoordinator coordinator: Coordinator)
}

extension Coordinator {
    func add(childCoordinator coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    func remove(childCoordinator coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter{$0 !== coordinator}
    }
}

extension Coordinator {
    var context: NSManagedObjectContext {
           guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
               return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
           }
           return appDelegate.persistentContainer.viewContext
           
    }
}
