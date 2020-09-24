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
    var viewModel: LoginViewModel = LoginViewModel()
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
    func didTapLoginButton(email: String?, password: String?) {
        guard let email = email, let password = password else{ return }
        viewModel.performLogin(email: email, password: password)
    }
    
    func didTapSignupButton(email: String?, password: String?) {
        guard let email = email, let password = password else{ return }
        viewModel.createUser(email: email, password: password) { [weak self] (result) in
            switch result{
            case .success(_):
                self?.coordinator?.showHome()
            case .failure(let error):
                let messageError = error.errorMessage
                let alert = UIAlertController(title: "Erro!", message: messageError, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self?.present(alert, animated: true)
            }
        }

        
    }
    
    func didTapTermsButton() {
        print("terms")
    }
}
