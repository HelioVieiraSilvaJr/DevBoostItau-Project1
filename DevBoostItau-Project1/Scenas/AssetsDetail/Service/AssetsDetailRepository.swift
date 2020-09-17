//
//  AssetsDetailRepository.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class AssetDetailRepository {
    
    private var service: AssetDetailService!
    
    init(_ service: AssetDetailService = AssetDetailService()) {
        self.service = service
    }
    
    func getStockPrice(code: String, onSuccess: @escaping (StockPrice) -> Void, onFail: @escaping (String) -> Void) {

        guard let url = URL(string: String(format: "https://api.hgbrasil.com/finance/stock_price?key=a6f97fc3&symbol=%@", code)) else {
            onFail("URL inválida!")
            return
        }
        
        service.getStockPrice(url: url, success: { assetDetail in
            onSuccess(assetDetail)
        }) { error in
            onFail(error)
        }
    }
    
}
