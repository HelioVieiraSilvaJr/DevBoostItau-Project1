//
//  AddOrEditStockView.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

protocol AddOrEditStockViewDelegate: AnyObject {
    func didTapCloseButton()
    func didTapInvestOrSaveButton()
}

final class AddOrEditStockView: BaseView {
    weak var delegate: AddOrEditStockViewDelegate?
    
    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()
    let closeButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "close"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Preecha as informações sobre a nova compra de ações"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 24.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let stockStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let stockLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Ativo"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let stockTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.groupTableViewBackground
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.keyboardType = .default
        textField.autocapitalizationType = .words
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let quantityStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let quantityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Quantidade"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let quantityTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.groupTableViewBackground
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let priceStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Preço de Compra"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.groupTableViewBackground
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let startDateStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let startDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Data de início"
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let startDateTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = UIColor.groupTableViewBackground
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let textsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let investOrSaveButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("Investir", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    // MARK: - Inits
    convenience init(delegate: AddOrEditStockViewDelegate){
        self.init()
        self.delegate = delegate
    }
    
    override func initialize() {
        contentView.backgroundColor = UIColor.white
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        stockStackView.addArrangedSubview(stockLabel)
        stockStackView.addArrangedSubview(stockTextField)
        quantityStackView.addArrangedSubview(quantityLabel)
        quantityStackView.addArrangedSubview(quantityTextField)
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceTextField)
        startDateStackView.addArrangedSubview(startDateLabel)
        startDateStackView.addArrangedSubview(startDateTextField)
        textsStackView.addArrangedSubview(stockStackView)
        textsStackView.addArrangedSubview(quantityStackView)
        textsStackView.addArrangedSubview(priceStackView)
        textsStackView.addArrangedSubview(startDateStackView)
        contentView.addSubview(closeButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textsStackView)
        contentView.addSubview(investOrSaveButton)
    }
    
    override func installConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //Content View
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            textsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            textsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            investOrSaveButton.topAnchor.constraint(greaterThanOrEqualTo: textsStackView.bottomAnchor, constant: -24),
            investOrSaveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            investOrSaveButton.heightAnchor.constraint(equalToConstant: 50),
            investOrSaveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            investOrSaveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            stockTextField.heightAnchor.constraint(equalToConstant: 40),
            quantityTextField.heightAnchor.constraint(equalToConstant: 40),
            priceTextField.heightAnchor.constraint(equalToConstant: 40),
            startDateTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        let contentViewHeightContraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightContraint.priority = .defaultLow
        contentViewHeightContraint.isActive = true
    }
    
    override func setupExtraConfigurations() {
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        investOrSaveButton.addTarget(self, action: #selector(verifyErrorTapped), for: .touchUpInside)
    }
    
    @objc private func closeTapped() {
        delegate?.didTapCloseButton()
    }
    @objc private func verifyErrorTapped() {
        verifyError()
    }
    
    func verifyError() {
        stockLabel.textColor = stockTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        startDateLabel.textColor = startDateTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        priceLabel.textColor = priceTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        quantityLabel.textColor = quantityTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        if  !(stockTextField.text?.isEmpty ?? false) && !(quantityTextField.text?.isEmpty ?? false) && !(priceTextField.text?.isEmpty ?? false) && !(startDateTextField.text?.isEmpty ?? false) {
            delegate?.didTapInvestOrSaveButton()
        }
    }
    func setSaveButton() {
        investOrSaveButton.setTitle("Save", for: .normal)
    }
}
