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
    private var asset: AssetModel?
    private var stockPrice: StockPrice?
    
    init(asset: AssetModel?, _ repository: AssetDetailRepository = AssetDetailRepository()) {
        self.asset = asset
        self.repository = repository
    }
    
    var onSuccess: (() -> Void)?
    var onFail: ((String) -> Void)?
    
    func getStockPrice() {
        guard let code = asset?.brokerName else {return}
        repository.getStockPrice(code: code, onSuccess: { [weak self] stockPrice in
            self?.stockPrice = stockPrice
            self?.onSuccess?()
        }) { [weak self] error in
            self?.onFail?(error)
        }
    }
    
    func getAssetDetail() -> AssetDetail? {
        guard let asset = asset, let stockPrice = stockPrice else {return nil}
        return AssetDetail(name: stockPrice.getName,
                           quantity: "\(asset.quantityOfStocks)",
                           pricePurchase: asset.getPricePurchase(),
                           datePurchase: asset.getDatePurchase(),
                           totalValuePurchase: asset.getTotalValuePurchase(),
                           dateToday: asset.dateFormatter.string(from: Date()),
                           valueToday: getTotalValueToday(),
                           rentability: getRentability(),
                           hasPositiveResults: getRentabilityValue() >= 0 ? true : false,
                           investment: asset.investment)
    }
    
    func getTotalValueToday() -> String {
        let quantity = Double(asset?.quantityOfStocks ?? 0)
        let priceToday = stockPrice?.getPriceNumber ?? 0.0

        let totalValue = quantity * priceToday
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: totalValue)) ?? "R$ 0,00"
    }
    
    func getRentabilityValue() -> Double {
        let quantity = Double(asset?.quantityOfStocks ?? 0)
        let pricePurchase = asset?.purchasePrice ?? 0
        let priceToday = stockPrice?.getPriceNumber ?? 0.0
        
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
