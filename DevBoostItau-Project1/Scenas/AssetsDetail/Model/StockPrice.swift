//
//  AssetDetail.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

protocol AssetDetailResponse: Decodable {
    var by: String {get}
}

struct StockPrice: AssetDetailResponse {
    var by: String
    let results: [String:Results]
    
    struct Results: Decodable {
        let symbol: String
        let name: String
        let region: String
        let currency: String
        let price: Double
        let changePercent: Double
        
        private enum CodingKeys : String, CodingKey {
            case symbol, name, region, currency, price
            case changePercent = "change_percent"
        }
    }
    
    private func getResult() -> Results? {
        for result in results {
            return result.value
        }
        return nil
    }
    
    var getName: String {
        guard let symbol = getResult()?.symbol, let name = getResult()?.name else {return "Asset Name"}
        return "\(symbol) - \(name)"
    }
    
    var getPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: getResult()?.price ?? 0.0)) ?? "R$ 0,00"
    }
    
    var getPriceNumber: Double {
        return getResult()?.price ?? 0.0
    }
}
