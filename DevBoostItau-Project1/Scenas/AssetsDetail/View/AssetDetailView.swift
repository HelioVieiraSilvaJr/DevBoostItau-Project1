//
//  AssetDetailView.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

protocol AssetDetailViewDelegate: AnyObject {
    func pressEditButton()
    func pressCloseButton()
}

class AssetDetailView: UIView {
    
    // MARK: Properties
    weak var delegate: AssetDetailViewDelegate?
    private var assetDetail: AssetDetail?
    private var asset: AssetModel?
    
    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setBackgroundImage(#imageLiteral(resourceName: "icClose"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let assetNameLabel: UILabel = {
        var label = UILabel()
        label.text = "ASSET - NAME"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let editButton: CustomButton = CustomButton(title: "Editar informações")
    
    var imageNotFound: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "imgNotFound"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelNotFound: UILabel = {
        var label = UILabel()
        label.text = "Seu investimento não foi encontrado!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: Inits
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initialize(assetDetail: AssetDetail?, asset: AssetModel?) {
        self.assetDetail = assetDetail
        self.asset = asset
        
        let stackQuantity = TitleBodyLabel(title: "Quantidade", body: "\(asset?.quantityOfStocks ?? 0)", style: .simple)
        let stackPricePurchase = TitleBodyLabel(title: "Preço compra", body: asset?.getPricePurchase() ?? "R$ 0,00", style: .simple)
        let stackDatePurchase = TitleBodyLabel(title: "Data da compra", body: asset?.getDatePurchase() ?? "-", style: .simple)
        let stackValuePurchase = TitleBodyLabel(title: "Valor total", body: asset?.getTotalValuePurchase() ?? "-", style: .simple)
        let stackDateToday = TitleBodyLabel(title: "Cotação de Hoje", body: asset?.dateFormatter.string(from: Date()) ?? "-", style: getRentabilityValue() >= 0 ? .colorGreen : .colorRed)
        let stackValueToday = TitleBodyLabel(title: "Valor total", body: getTotalValueToday(), style: getRentabilityValue() >= 0 ? .colorGreen : .colorRed)
        let stackRentability = TitleBodyLabel(title: "Rentabilidade obtida até hoje", body: getRentability(), style: getRentabilityValue() >= 0 ? .gigantColorGreen : .gigantColorRed)
        
        
        addSubview(contentView)
        contentView.addSubview(line1StackView)
        
        contentView.addSubview(closeButton)
        
        let assetName = assetNameLabel
        assetName.text = assetDetail?.getName
        contentView.addSubview(assetName)
        
        line1StackView.addArrangedSubview(stackQuantity)
        stackPricePurchase.body = asset?.getPricePurchase() ?? "R$ 0,00"
        line1StackView.addArrangedSubview(stackPricePurchase)
        stackQuantity.alignment = .leading
        stackPricePurchase.alignment = .trailing
        
        contentView.addSubview(line2StackView)
        line2StackView.addArrangedSubview(stackDatePurchase)
        line2StackView.addArrangedSubview(stackValuePurchase)
        stackDatePurchase.alignment = .leading
        stackValuePurchase.alignment = .trailing
        
        contentView.addSubview(separetedView)

        contentView.addSubview(line3StackView)
        line3StackView.addArrangedSubview(stackDateToday)
        line3StackView.addArrangedSubview(stackValueToday)
        stackDateToday.alignment = .leading
        stackValueToday.alignment = .trailing
        
        contentView.addSubview(stackRentability)
        
        contentView.addSubview(editButton)
        
        contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        assetNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        assetNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        assetNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        line1StackView.topAnchor.constraint(equalTo: assetNameLabel.bottomAnchor, constant: 30).isActive = true
        line1StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        line1StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        line2StackView.topAnchor.constraint(equalTo: line1StackView.bottomAnchor, constant: 20).isActive = true
        line2StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        line2StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        separetedView.topAnchor.constraint(equalTo: line2StackView.bottomAnchor, constant: 25).isActive = true
        separetedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        separetedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        separetedView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        line3StackView.topAnchor.constraint(equalTo: separetedView.bottomAnchor, constant: 25).isActive = true
        line3StackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        line3StackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        stackRentability.topAnchor.constraint(equalTo: line3StackView.bottomAnchor, constant: 30).isActive = true
        stackRentability.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        editButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        editButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        setupExtraConfigurations()
    }
    
    func showNotFound() {
        addSubview(contentView)
        
        contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(imageNotFound)
        imageNotFound.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageNotFound.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imageNotFound.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageNotFound.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        contentView.addSubview(labelNotFound)
        labelNotFound.topAnchor.constraint(equalTo: imageNotFound.bottomAnchor, constant: 20).isActive = true
        labelNotFound.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        setupExtraConfigurations()
    }
    
    // MARK: Helpers
    func setupExtraConfigurations() {
        closeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(sender: UIButton) {
        switch sender {
        case closeButton:
            delegate?.pressCloseButton()
        case editButton:
            delegate?.pressEditButton()
        default:
            break
        }
    }
    
    func getTotalValueToday() -> String {
        let quantity = Double(asset?.quantityOfStocks ?? 0)
        let priceToday = assetDetail?.getPriceNumber ?? 0.0

        let totalValue = quantity * priceToday
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: NSNumber(value: totalValue)) ?? "R$ 0,00"
    }
    
    func getRentabilityValue() -> Double {
        let quantity = Double(asset?.quantityOfStocks ?? 0)
        let pricePurchase = asset?.purchasePrice ?? 0
        let priceToday = assetDetail?.getPriceNumber ?? 0.0
        
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
