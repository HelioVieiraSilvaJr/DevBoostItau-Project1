//
//  AssetsViewController.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit
import CoreData

class AssetsViewController: BaseViewController, HasCodeView {

    typealias CustomView = AssetsView

    // MARK: Properties
    private var totalFunds: Double = 0.0
    private var balanceHidden = false
    lazy var viewModel = AssetsViewModel(context: context)
    weak var coordinator: AssetsCoordinator?
    
    // MARK: Overrides
    
    override func loadView() {
        view = AssetsView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.investmentsDidUpdate = investmentsDidUpdate
        self.customView.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
        viewModel.loadInvestments()
    }
    
    // MARK: Methods
    
    func investmentsDidUpdate(){
        DispatchQueue.main.async {
            self.customView.tableView.reloadData()
            self.updateTotalFunds()
        }
    }
}

extension AssetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AssetCell", for: indexPath) as? AssetTableViewCell else{
            return UITableViewCell()
        }

        let investmentCellViewModel = viewModel.cellViewModelFor(indexPath: indexPath)
        cell.configure(with: investmentCellViewModel, percent: viewModel.getInvestmentPercentFor(indexPath))

        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: Localization.edit, handler: { (action, indexPath) in
            self.coordinator?.editInvestment(viewModel: self.viewModel.getEditInvestmentViewModelFor(indexPath))
        })
        editAction.backgroundColor = UIColor.lightGray
        
        let deleteAction = UITableViewRowAction(style: .default, title: Localization.delete, handler: { (action, indexPath) in
            self.viewModel.deleteInvestment(at: indexPath)
        })
        
        return [editAction, deleteAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let asset = viewModel.getInvestment(at: indexPath)
//        guard let _ = asset.brokerCode else {return}
        
        let assetDetailViewModel = viewModel.getAssetViewModelFor(indexPath)
        coordinator?.showInvestment(viewModel: assetDetailViewModel)
    }
    
    func updateTotalFunds() {
        totalFunds = viewModel.getTotalBalance()
        if !balanceHidden {
            customView.balanceLabel.text = "R$ \(totalFunds)"
        }
    }
}

extension AssetsViewController: AssetsViewDelegate {
    func showBalance() {
        balanceHidden.toggle()
        customView.balanceLabel.text = balanceHidden ? "--" : "R$ \(totalFunds)"
    }

    func goToNewInvestment() {
        self.coordinator?.editInvestment(viewModel: nil)
    }
}
