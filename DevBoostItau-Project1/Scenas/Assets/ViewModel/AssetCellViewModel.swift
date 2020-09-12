//
//  AssetCellViewModel.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/12/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class AssetCellViewModel{
    private var investment: Investment
    
    init(investment: Investment){
        self.investment = investment
    }
    
    var brokerName: String?{
        investment.brokerName
    }

    var purchasePrice: Double{
        investment.purchasePrice
    }

    func getInvestmentValue() -> Double{
           InvestmentsManager.getInvestmentValue(investment: investment)
    }
    
//    func calculatePercent(totalInvestment: Double) -> Double{
//        let currentTotal = InvestmentsManager.getInvestmentValue(investment: investment)
//        let percent = 100 * currentTotal / totalInvestment
//        return percent
//    }
}
