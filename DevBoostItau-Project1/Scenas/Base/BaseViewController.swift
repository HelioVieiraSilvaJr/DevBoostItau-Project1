//
//  BaseViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit
import CoreData

class BaseViewController: UIViewController {
    
    private let loadingView: LoadingCustom = LoadingCustom.fromNib()
    
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLoadingView()
    }
}

// MARK: LoadingView
extension BaseViewController {
    private func configureLoadingView() {
        loadingView.isHidden = true
        loadingView.frame = view.bounds
        view.addSubview(loadingView)
        loadingView.bringSubviewToFront(view)
    }
    
    func showLoading() {
        loadingView.isHidden = false
    }
    
    func closeLoading() {
        DispatchQueue.main.async {
            self.loadingView.isHidden = true
        }
    }
}
