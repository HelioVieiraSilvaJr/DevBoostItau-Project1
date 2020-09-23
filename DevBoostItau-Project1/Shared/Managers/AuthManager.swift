//
//  AuthManager.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 23/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation
import Firebase

class AuthManager {
    
    // MARK: - Properties
    static let shared = AuthManager()
    
    private init() {
    }
    
    // MARK: - Methods
    func isLoggedIn() -> Bool {
        if let _ = Auth.auth().currentUser {
            return true
        } else {
            return false
        }
    }
    
    func performLogout() -> Bool {
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            print("Could not sign out user")
            return false
        }
    }
    
    func performLoginWith(username: String, password: String) -> Bool {
        return true
    }
}
