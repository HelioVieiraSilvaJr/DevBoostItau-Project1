//
//  AssetDetailView.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

protocol AssetDetailViewDelegate: AnyObject {
    func pressButtonEdit()
}

class AssetDetailView: BaseView {
    
    // MARK: Properties
    weak var delegate: AssetDetailViewDelegate?
    
    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let line1StackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let line2StackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let line3StackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let separetedView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackQuantity = TitleBodyLabel(title: "Quantidade", body: "R$ 4.987,09", style: .simple)
    let stackPricePurchase = TitleBodyLabel(title: "Preço compra", body: "R$ 34,00", style: .simple)
    let stackDatePurchase = TitleBodyLabel(title: "Data da compra", body: "10/01/1988", style: .simple)
    let stackValuePurchase = TitleBodyLabel(title: "Valor total", body: "R$ 12.980,00", style: .simple)
    let stackDateToday = TitleBodyLabel(title: "Cotação de Hoje", body: "12/09/2020", style: .colorGreen)
    let stackValueToday = TitleBodyLabel(title: "Valor total", body: "R$ 14.923,30", style: .colorRed)
    
    // MARK: Overrides
    override func initialize() {
        addSubview(contentView)
        contentView.addSubview(line1StackView)
        
        line1StackView.addArrangedSubview(stackQuantity)
        line1StackView.addArrangedSubview(stackPricePurchase)
        stackQuantity.alignment = .leading
        stackPricePurchase.alignment = .trailing
        
        contentView.addSubview(line2StackView)
        line2StackView.addArrangedSubview(stackDatePurchase)
        line2StackView.addArrangedSubview(stackValuePurchase)
        stackDatePurchase.alignment = .leading
        stackValuePurchase.alignment = .trailing
        
        contentView.addSubview(line3StackView)
        line3StackView.addArrangedSubview(stackDateToday)
        line3StackView.addArrangedSubview(stackValueToday)
        stackDateToday.alignment = .leading
        stackValueToday.alignment = .trailing
        
        contentView.addSubview(separetedView)
        
    }
    
    override func installConstraints() {
        contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        line1StackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        line1StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        line1StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        line2StackView.topAnchor.constraint(equalTo: line1StackView.bottomAnchor, constant: 20).isActive = true
        line2StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        line2StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        separetedView.topAnchor.constraint(equalTo: line2StackView.bottomAnchor, constant: 20).isActive = true
        separetedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        separetedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        separetedView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        line3StackView.topAnchor.constraint(equalTo: separetedView.bottomAnchor, constant: 20).isActive = true
        line3StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        line3StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    }
}
