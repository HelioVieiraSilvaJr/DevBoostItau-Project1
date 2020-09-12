//
//  AddOrEditStock.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

final class AddOrEditStockView: BaseView {
    
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
    
    let investOrSaveButton: GradientButton = {
        let button = GradientButton()
        button.setTitle("Investir", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func initialize() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(investOrSaveButton)
    }
    
    override func installConstraints() {
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //Content View
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        let contentViewHeightContraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightContraint.priority = .defaultLow
        contentViewHeightContraint.isActive = true
        
        investOrSaveButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        investOrSaveButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        investOrSaveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        investOrSaveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        investOrSaveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func setSaveButton() {
        investOrSaveButton.setTitle("Save", for: .normal)
    }
}
