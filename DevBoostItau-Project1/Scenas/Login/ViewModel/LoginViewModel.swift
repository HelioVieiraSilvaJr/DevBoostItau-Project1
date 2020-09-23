//
//  LoginViewModel.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 23/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class LoginViewModel {
    // MARK: - Properties
    // MARK: - Methods
    func createUser(email: String, password: String) {
        AuthManager.shared.createUser(email: email, password: password) { (error) in
            if let error = error {
                // Alertar usuário com erro
                print(error)
            } else {
                // Conta criado com successo, redirecionar para Home
            }
        }
    }
    
    func performLogin(email: String, password: String) {
        AuthManager.shared.performLoginWith(email: email, password: password) { (error) in
            if let error = error {
                // Alertar usuário com erro
                print(error)
            } else {
                // Login successo, redirecionar para Home
            }
        }
    }
    
    func performLogout() {
        let logoutSuccess = AuthManager.shared.performLogout()
        if logoutSuccess {
            // redirecionar para Home
        } else {
            print("Não foi possível realizar o logout.")
        }
    }
}
