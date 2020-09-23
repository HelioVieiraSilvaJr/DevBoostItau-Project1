//
//  AssetModel.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class AssetModel {
    let brokerCode: String
    let brokerName: String?
    let purchaseDate: Date?
    let purchasePrice: Double
    let quantityOfStocks: Int32
    
    let investment: Investment?
    
    init(brokerCode: String, brokerName: String?, purchaseDate: Date?, purchasePrice: Double, quantityOfStocks: Int32) {
        self.brokerCode = brokerCode
        self.brokerName = brokerName
        self.purchaseDate = purchaseDate
        self.purchasePrice = purchasePrice
        self.quantityOfStocks = quantityOfStocks
        investment = nil
    }
           
    init(from investment: Investment) {
//        self.investment = investment
        brokerCode = investment.brokerCode ?? "ITSA4"
        brokerName = investment.brokerName ?? "TTAUSA"
        purchaseDate = investment.purchaseDate
        purchasePrice = investment.purchasePrice
        quantityOfStocks = investment.quantityOfStocks
        self.investment = nil
    }
}

extension AssetModel {
    var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }
    
    func getPricePurchase() -> String {
        return currencyFormatter.string(from: NSNumber(value: purchasePrice)) ?? "R$ 0,00"
    }
    
    func getDatePurchase() -> String {
        guard let purchaseDate = purchaseDate else {return "---"}
        return dateFormatter.string(from: purchaseDate)
    }
    
    func getTotalValuePurchase() -> String {
        let quantity = Double(quantityOfStocks)
        let pricePurchase = purchasePrice

        let totalValue = quantity * pricePurchase
        return currencyFormatter.string(from: NSNumber(value: totalValue)) ?? "R$ 0,00"
    }
    
    
}

