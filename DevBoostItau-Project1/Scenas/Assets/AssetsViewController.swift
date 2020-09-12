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
    private var balanceHidded = false
    lazy var viewModel = AssetsViewModel(context: context)
    weak var coordinator: AssetsCoordinator?
    
    lazy var investmentManager: InvestmentsManager = {[weak self] in
        let investmentManager = InvestmentsManager(context: context)
        investmentManager.delegate = self
        return investmentManager
    }()
    
    // MARK: Overrides
    
    override func loadView() {
        view = AssetsView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.investmentsDidUpdate = investmentsDidUpdate
        self.customView.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadInvestments()
    }
    
    // MARK: Methods
    
    func investmentsDidUpdate(){
        DispatchQueue.main.async {
            self.customView.tableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.customView.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
    }
    
    // MARK: Mathods
    
    func setupMockData() {
        let investment1 = Investment(context: context)
        investment1.brokerCode = "inv1"
        investment1.brokerName = "Clear Corretora"
        investment1.quantityOfStocks = 100
        investment1.purchaseDate = Date()
        investment1.purchasePrice = 5.56
        
        do {
            try context.save()
        } catch {
            print("Deu ruim")
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
        let editAction = UITableViewRowAction(style: .default, title: "editar", handler: { (action, indexPath) in
            self.navigationController?.present(AddOrEditStockViewController(investment: self.viewModel.getInvestment(at: indexPath)), animated: true, completion: nil)
        })
        editAction.backgroundColor = UIColor.lightGray
        
        let deleteAction = UITableViewRowAction(style: .default, title: "excluir", handler: { (action, indexPath) in
            self.viewModel.deleteInvestment(at: indexPath)
        })
        
        return [editAction, deleteAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let asset = viewModel.getInvestment(at: indexPath)
        guard let _ = asset.brokerCode else {return}
        
        let assetDetailViewModel = viewModel.getAssetViewModelFor(indexPath)
        coordinator?.showInvestment(viewModel: assetDetailViewModel)
    }
    
    func updateTotalFunds() {
        totalFunds = viewModel.getTotalBalance()
        if !balanceHidded {
            customView.balanceLabel.text = "R$ \(totalFunds)"
        }
    }
}

extension AssetsViewController: AssetsViewDelegate {
    func showBalance() {
        balanceHidded.toggle()
        customView.balanceLabel.text = balanceHidded ? "--" : "R$ \(totalFunds)"
    }

    func goToNewInvestment() {
//        coordinator.editInvestment()
        navigationController?.present(AddOrEditStockViewController(), animated: true, completion: nil)
    }
}

extension AssetsViewController: NSFetchedResultsControllerDelegate, AssetsViewModelDelegate {
    func updateList() {
        customView.tableView.reloadData()
        updateTotalFunds()
    }
    
    func fetchInvestment() {
        investmentManager.performFetch()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if let investment = anObject as? Investment {
            switch type {
            case .delete:
                print("Código para atualizar a posição o invesment da tabela")
//                if let indexPath = indexPath{
//                    viewModel.deleteInvestment(at: indexPath)
//                }
//                let index = investments.firstIndex(where: { $0 == investment })
//                if let index = index {
//                    investments.remove(at: index)
//                }
            case .move:
                print("Código para atualizar a posição o invesment da tabela")
            case .update:
                print("Código para atualizar o invesment da tabela")
            case .insert:
                print("Código para atualizar o invesment da tabela")
//                investments.append(investment)
            @unknown default:
                print("Cenário desconhecido")
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        customView.tableView.reloadData()
        updateTotalFunds()
    }
}
