//
//  AppDelegate.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRootViewController()
        
        return true
    }

    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "DevBoostItau_Project1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

extension AppDelegate {
    func setupRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
                
                //DEPRECATED
//                let viewController = UIStoryboard(name: "HomeViewController", bundle: nil)
//                    .instantiateViewController(withIdentifier: "NavHomeViewController")
//                window?.rootViewController = viewController
                
                //SUBSTITUIR POR CORDINATOR
        //        appCoordinator = AppCoordinator()
        //        window?.rootViewController = appCoordinator?.navigationController
        //        appCoordinator?.start()
                
        window?.rootViewController = UINavigationController(rootViewController: AssetsViewController())
                window?.makeKeyAndVisible()
    }
}
