//
//  AssetModel.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

struct AssetModel {
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
        self.investment = investment
        brokerCode = investment.brokerCode ?? "ITSA4"
        brokerName = investment.brokerName ?? "TTAUSA"
        purchaseDate = investment.purchaseDate
        purchasePrice = investment.purchasePrice
        quantityOfStocks = investment.quantityOfStocks
    }
}

