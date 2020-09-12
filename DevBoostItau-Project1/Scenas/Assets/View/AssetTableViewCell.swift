//
//  AssetTableViewCell.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetTableViewCell: UITableViewCell {
    static let identifier = "AssetCell"

    private let pinkView: UIView = {
        let view = UIView()
        view.backgroundColor = .itiPink
        view.clipsToBounds = true
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "ITSA4 - ITAUSA"
        label.textColor = .itiGrey
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let currentBalanceDescLabel: UILabel = {
       let label = UILabel()
        label.text = "saldo atual"
        label.textColor = .itiGrey
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let currentBalanceLabel: UILabel = {
       let label = UILabel()
        label.text = "R$ 3.256,00"
        label.textColor = .itiPink
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let percentBalanceDescLabel: UILabel = {
       let label = UILabel()
        label.text = "% na carteira"
        label.textColor = .itiGrey
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let percentBalanceLabel: UILabel = {
       let label = UILabel()
        label.text = "15,45%"
        label.textColor = .itiPink
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let currentBalanceStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let percentBalanceStackView: UIStackView = {
       let stackView = UIStackView(frame: .zero)
       stackView.axis = .vertical
       stackView.distribution = .fillEqually
       stackView.alignment = .trailing
       stackView.spacing = 0
       stackView.translatesAutoresizingMaskIntoConstraints = false
       return stackView
   }()
    
    let lineBalanceStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let lineAndNameStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let allContentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        addSubview(allContentStackView)
        allContentStackView.addArrangedSubview(pinkView)
        allContentStackView.addArrangedSubview(lineAndNameStackView)
    
        lineAndNameStackView.addArrangedSubview(nameLabel)
        lineAndNameStackView.addArrangedSubview(lineBalanceStackView)
        
        lineBalanceStackView.addSubview(currentBalanceStackView)
        lineBalanceStackView.addSubview(percentBalanceStackView)
        
        currentBalanceStackView.addArrangedSubview(currentBalanceDescLabel)
        currentBalanceStackView.addArrangedSubview(currentBalanceLabel)
        
        percentBalanceStackView.addArrangedSubview(percentBalanceDescLabel)
        percentBalanceStackView.addArrangedSubview(percentBalanceLabel)
        
        
        installConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints(){
        contentView.heightAnchor.constraint(equalToConstant: 91).isActive = true
        
        allContentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        allContentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        allContentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        allContentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        pinkView.widthAnchor.constraint(equalToConstant: 4).isActive = true
        pinkView.heightAnchor.constraint(equalToConstant: 68).isActive = true
        
        lineAndNameStackView.trailingAnchor.constraint(equalTo: allContentStackView.trailingAnchor).isActive = true
        
        nameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        nameLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        
//        lineBalanceStackView.trailingAnchor.constraint(equalTo: lineAndNameStackView.trailingAnchor).isActive = true
        lineBalanceStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        currentBalanceStackView.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .horizontal)
        currentBalanceLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        currentBalanceLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        currentBalanceDescLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        currentBalanceDescLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        
        percentBalanceStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:
            -16).isActive = true
        percentBalanceLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        percentBalanceLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        percentBalanceDescLabel.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        percentBalanceDescLabel.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        
        
    }
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//
//    }

    func configure(with investment: Investment){
        nameLabel.text = investment.brokerName
        currentBalanceLabel.text = investment.purchasePrice.formatMoney()
    }
}


