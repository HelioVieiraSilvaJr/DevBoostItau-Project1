//
//  AssetTableViewCell.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var percentBalanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with investment: Investment, percent: Double) {
        nameLabel.text = investment.brokerName
        let total = InvestmentsManager.getInvestmentValue(investment: investment)
        currentBalanceLabel.text = total.formatMoney()
        percentBalanceLabel.text = "\(String(format: "%.2f", percent))%"
    }
}


