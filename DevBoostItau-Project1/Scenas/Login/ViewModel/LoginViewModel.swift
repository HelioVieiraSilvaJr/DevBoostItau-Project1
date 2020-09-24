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
    func createUser(email: String, password: String, _ completion: @escaping ((Result<String, APIError>) -> Void)) {
        AuthManager.shared.createUser(email: email, password: password) { (error) in
            if let error = error {
                // Alertar usuário com erro
                print(error)
                completion(Result.failure(APIError.error(error)))
            } else {
                completion(Result.success("Logged wit success"))
            }
        }
    }
    
    func performLogin(email: String, password: String, _ completion: @escaping ((Result<String, APIError>) -> Void)) {
        AuthManager.shared.performLoginWith(email: email, password: password) { (error) in
            if let error = error {
                // Alertar usuário com erro
                print(error)
                completion(Result.failure(APIError.error(error)))
            } else {
                // Login successo, redirecionar para Home
                completion(Result.success("Logged wit success"))
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
