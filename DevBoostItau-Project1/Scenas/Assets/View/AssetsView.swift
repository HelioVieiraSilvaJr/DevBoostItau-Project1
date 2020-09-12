//
//  AssetsView.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/12/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

protocol AssetsViewDelegate: AnyObject {
    func showBalance()
    func goToNewInvestment()
}

class AssetsView: BaseView{
    
    weak var delegate: AssetsViewDelegate?
    
    convenience init(delegate: AssetsViewDelegate){
        self.init()
        self.delegate = delegate
    }
    
    private let myBelongslabel: UILabel = {
       let label = UILabel()
        label.text = Localization.myWealth
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.alpha = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.text = "R$ 13.250,00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let seeBalanceButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "eyeIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 8
        tableView.register(AssetTableViewCell.self, forCellReuseIdentifier: AssetTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let newInvestmentButton: GradientButton = {
       let button = GradientButton()
        button.setTitle(Localization.newInvestment, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    
    override func initialize() {
        addSubview(myBelongslabel)
        addSubview(balanceLabel)
        addSubview(seeBalanceButton)
        addSubview(whiteView)
        addSubview(tableView)
        addSubview(newInvestmentButton)
    }
    
    override func installConstraints() {
        myBelongslabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Margin.vertical).isActive = true
        myBelongslabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Margin.horizontal).isActive = true
        myBelongslabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        balanceLabel.topAnchor.constraint(equalTo: myBelongslabel.bottomAnchor, constant: 3.5).isActive = true
        balanceLabel.leadingAnchor.constraint(equalTo: myBelongslabel.leadingAnchor).isActive = true

        
        seeBalanceButton.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor).isActive = true
        seeBalanceButton.heightAnchor.constraint(equalToConstant: 31.5).isActive = true
        seeBalanceButton.widthAnchor.constraint(equalToConstant: 26).isActive = true
        seeBalanceButton.leadingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: Margin.horizontalxxSmall).isActive = true

        
        tableView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: Margin.vertical).isActive = true
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        whiteView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -Margin.verticalSmall).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 101).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        newInvestmentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newInvestmentButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        newInvestmentButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Margin.horizontal).isActive = true
        newInvestmentButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Margin.horizontal).isActive = true
    }
    
    override func setupExtraConfigurations() {
        newInvestmentButton.addTarget(self, action: #selector(newInvestmentTapped), for: .touchUpInside)
        seeBalanceButton.addTarget(self, action: #selector(seeBalanceTapped), for: .touchUpInside)
    }
    
    @objc func newInvestmentTapped(){
        delegate?.goToNewInvestment()
    }
    
    @objc func seeBalanceTapped(){
        delegate?.showBalance()
    }
}
