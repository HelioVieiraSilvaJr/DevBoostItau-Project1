//
//  HomeViewModel.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation
import CoreData

class HomeViewModel {
    
    // MARK: - Properties
    var balanceVisible: Bool = false
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    // MARK: - Methods
    func getBalance() -> String {
        if !balanceVisible {
            return "R$  -----"
        }
        
        let fetchRequest: NSFetchRequest<Investment> = Investment.fetchRequest()
        do {
            let investments = try context.fetch(fetchRequest)
            let total = InvestmentsManager.getTotalInvestmentsValue(investments: investments)
            return "\(total.formatMoney())"
        } catch {
            print("error")
        }
        return ""
        
    }
    
    func performLogout(_ completion: @escaping ((Result<String, APIError>) -> Void)) {
        let logoutSuccess = AuthManager.shared.performLogout()
        if logoutSuccess {
            completion(Result.success(""))
        } else {
            completion(Result.failure(APIError.error("error ao fazer logout")))
            print("Não foi possível realizar o logout.")
        }
    }
}
