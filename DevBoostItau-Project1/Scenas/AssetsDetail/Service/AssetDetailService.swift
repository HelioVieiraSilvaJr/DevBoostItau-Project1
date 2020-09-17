//
//  AssetDetailService.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class AssetDetailService {
    
    
    func getStockPrice(url: URL, success: @escaping (StockPrice) -> (), failure: @escaping (String) -> ()) {
        Network.get(url: url) { (data, error) in
            if let error = error {
                failure(error)
            }

            do {
                guard let data = data else { return }
                let result = try JSONDecoder().decode(StockPrice.self, from: data)
                success(result)
            } catch let err {
                failure(err.localizedDescription)
            }
        }
    }
}
