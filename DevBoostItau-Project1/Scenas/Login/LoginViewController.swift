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
        let customView = LoginView(delegate: self)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension LoginViewController: LoginViewDelegate{
    func didTapLoginButton() {
        print("login")
    }
    
    func didTapSignupButton() {
        print("signup")
    }
    
    func didTapTermsButton() {
        print("terms")
    }
}
