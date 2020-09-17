//
//  AssetDetail.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 16/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

struct AssetDetail {
    let name: String
    let quantity: String
    let pricePurchase: String
    let datePurchase: String
    let totalValuePurchase: String
    let dateToday: String
    let valueToday: String
    let rentability: String
    let hasPositiveResults: Bool
    let investment: Investment?
}
