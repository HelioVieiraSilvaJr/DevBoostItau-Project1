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
    func pressShareButton()
}

class AssetDetailView: BaseView {
    
    // MARK: Properties
    weak var delegate: AssetDetailViewDelegate?
    private var assetDetail: AssetDetail?
    
    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "close"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "shareIcon"), for: .normal)
        button.clipsToBounds = true
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
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let line2StackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let line3StackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
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
    
    let editButton: CustomButton = CustomButton(title: Localization.editInformation)
    
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
        label.textColor = .itiGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stackRentability = TitleBodyLabel(title: Localization.rentabilityObtainedUpToToday, body: "", style: .simple)
    var stackQuantity = TitleBodyLabel(title: Localization.quantity, body: "--", style: .simple)
    var stackPricePurchase = TitleBodyLabel(title: Localization.purchasePrice, body: "--", style: .simple)
    var stackDatePurchase = TitleBodyLabel(title: Localization.purchaseDate, body: "--", style: .simple)
    var stackValuePurchase = TitleBodyLabel(title: Localization.totalValue, body: "--", style: .simple)
    var stackDateToday = TitleBodyLabel(title: Localization.quotationPriceToday, body: "--", style: .colorGreen)
    var stackValueToday = TitleBodyLabel(title: Localization.valueToday, body: "--", style: .colorGreen)
    
    // MARK: Inits
    override func initialize() {
        addSubview(contentView)
        contentView.addSubview(assetNameLabel)
        contentView.addSubview(closeButton)
        contentView.addSubview(shareButton)
        
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
        contentView.addSubview(stackRentability)
        contentView.addSubview(editButton)
    }
    
    override func installConstraints() {
        contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        shareButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        assetNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70).isActive = true
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
    }
    
    func showNotFound() {
        contentView.addSubview(imageNotFound)
        imageNotFound.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageNotFound.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -100).isActive = true
        imageNotFound.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageNotFound.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        contentView.addSubview(labelNotFound)
        labelNotFound.topAnchor.constraint(equalTo: imageNotFound.bottomAnchor, constant: 20).isActive = true
        labelNotFound.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        setupExtraConfigurations()
    }
    
    func updateUI(assetDetail: AssetDetail) {
        let isPositive = assetDetail.hasPositiveResults
        assetNameLabel.text = assetDetail.name
        stackQuantity.setInfos(body: assetDetail.quantity)
        stackPricePurchase.setInfos(body: assetDetail.pricePurchase)
        stackDatePurchase.setInfos(body: assetDetail.datePurchase)
        stackValuePurchase.setInfos(body: assetDetail.totalValuePurchase)
        stackDateToday.setInfos(body: assetDetail.dateToday, style: isPositive ? .colorGreen : .colorRed)
        stackValueToday.setInfos(body: assetDetail.valueToday, style: isPositive ? .colorGreen : .colorRed)
        stackRentability.setInfos(body: assetDetail.rentability, style: isPositive ? .gigantColorGreen : .gigantColorRed)
    }
    
    // MARK: Helpers
    override func setupExtraConfigurations() {
        closeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapped(sender: UIButton) {
        switch sender {
        case closeButton:
            delegate?.pressCloseButton()
        case editButton:
            delegate?.pressEditButton()
        case shareButton:
            delegate?.pressShareButton()
        default:
            break
        }
    }
}

