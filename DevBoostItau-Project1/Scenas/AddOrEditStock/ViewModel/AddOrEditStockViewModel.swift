//
//  AddOrEditStockViewModel.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation
import CoreData

final class AddOrEditStockViewModel {
    
    var context: NSManagedObjectContext?
    var investment: Investment?
    func saveInfo(brokerName: String,
                  brokerCode: String,
                  qtyOfStocks: String,
                  purchasePrice: String,
                  purchaseDate: String) -> Bool {
        
        guard let context = context else { return false }
        
        if (investment == nil) {
            investment = Investment(context: context)
        }
        
        investment?.brokerName = brokerName
        investment?.brokerCode = brokerCode
        if let qtyOfStocksInt = Int32(qtyOfStocks) {
            investment?.quantityOfStocks = qtyOfStocksInt
        }
        if let purchasePriceDouble = Double(purchasePrice) {
            investment?.purchasePrice = purchasePriceDouble
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        investment?.purchaseDate = dateFormatter.date(from: purchaseDate)
        
        do {
            try context.save()
            return true
        } catch {
            print("Could not create/update Investment model")
        }
        return false
    }
}
