//
//  LoginViewController.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/23/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, HasCodeView {
    
    // MARK: - Properts
    typealias CustomView = LoginView
    weak var coordinator: LoginCoordinator?
    // MARK: - Lifecycle
    override func loadView() {
        let customView = LoginView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
