//
//  AssetsDetailViewModel.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class AssetsDetailViewModel {
    
    let repository: AssetDetailRepository!
    var asset: Investment!
    var detail: AssetDetail?
    
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
    
    init(asset: Investment, _ repository: AssetDetailRepository = AssetDetailRepository()) {
        self.asset = asset
        self.repository = repository
    }
    
    var onSuccess: (() -> Void)?
    var onFail: ((String) -> Void)?
    
    func getAssetDetail() {
        
        // FIXME: Passar valor do codigo dinâmico, assim que finalizarmos o CRUD com o CoreData.
//        guard let code = asset?.brokerCode else {return}
        let code = "ITSA4"
        
        repository.getAsset(code: code, onSussecc: { [weak self] assetDetail in
            self?.detail = assetDetail
            self?.onSuccess?()
        }) { [weak self] error in
            self?.onFail?(error)
        }
    }
    
    func getPricePurchase() -> String {
        return currencyFormatter.string(from: NSNumber(value: asset?.purchasePrice ?? 0.0)) ?? "R$ 0,00"
    }
    
    func getDatePurchase() -> String {
        guard let purchaseDate = asset.purchaseDate else {return "---"}
        return dateFormatter.string(from: purchaseDate)
    }
    
    func getTotalValuePurchase() -> String {
        let quantity = Double(asset.quantityOfStocks)
        let pricePurchase = asset.purchasePrice
        
        let totalValue = quantity * pricePurchase
        return currencyFormatter.string(from: NSNumber(value: totalValue)) ?? "R$ 0,00"
    }
    
    func getTotalValueToday() -> String {
        let quantity = Double(asset.quantityOfStocks)
        let priceToday = detail?.getPriceNumber ?? 0.0
        
        let totalValue = quantity * priceToday
        return currencyFormatter.string(from: NSNumber(value: totalValue)) ?? "R$ 0,00"
    }
    
    func getRentabilityValue() -> Double {
        let quantity = Double(asset.quantityOfStocks)
        let pricePurchase = asset.purchasePrice
        let priceToday = detail?.getPriceNumber ?? 0.0
        
        let totalPurchase = quantity * pricePurchase
        let totalToday = quantity * priceToday
        
        let rentability = ((totalToday * 100) / totalPurchase) - 100
        return rentability
    }
    
    func getRentability() -> String {
        let rentability = getRentabilityValue()
        return "\(Int(rentability))%"
    }
}
