//
//  AssetsViewController.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit
import CoreData

class AssetsViewController: BaseViewController {

    // MARK: Properties
    private var balanceHidden = false
    private var totalFunds: Double = 0.0
    var investments: [Investment] = []
    lazy var investmentManager: InvestmentsManager = {[weak self] in
        let investmentManager = InvestmentsManager(context: context)
        investmentManager.delegate = self
        return investmentManager
    }()
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var seeBalanceButton: UIButton!
    @IBOutlet weak var newInvestmentButton: UIButton!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        setupView()
        loadInvestments()
    }

    // MARK: Actions
    @IBAction func showBalance(_ sender: Any) {
        balanceHidden.toggle()
        balanceLabel.text = balanceHidden ? "--" : "R$ \(totalFunds)"
    }
    
    @IBAction func goToNewInvestment(_ sender: Any) {
        navigationController?.present(AddOrEditStockViewController(), animated: true, completion: nil)
    }
    
    // MARK: Mathods
    func setupView(){
        self.view.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        newInvestmentButton.applyGradient(style: .horizontal, colors: [UIColor.itiOrange, UIColor.itiPink])
        
        newInvestmentButton.clipsToBounds = true
        newInvestmentButton.layer.cornerRadius = 25
        
        tableView.clipsToBounds = true
        tableView.layer.cornerRadius = 8
    }
    
    func loadInvestments() {
        let fetchRequest: NSFetchRequest<Investment> = Investment.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "purchaseDate", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            investments = try context.fetch(fetchRequest)
            tableView.reloadData()
            updateTotalFunds()
        } catch {
            print("error")
        }
        investmentManager.performFetch()
    }
}

extension AssetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return investments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AssetCell", for: indexPath) as? AssetTableViewCell else{
            return UITableViewCell()
        }

        let investment = investments[indexPath.row]
        let allTotal = InvestmentsManager.getTotalInvestmentsValue(investments: investments)
        let currentTotal = InvestmentsManager.getInvestmentValue(investment: investment)
        let percent = 100 * currentTotal / allTotal
        cell.configure(with: investment, percent: percent)

        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "editar", handler: { (action, indexPath) in
            let investment = self.investments[indexPath.row]
            self.navigationController?.present(AddOrEditStockViewController(investment: investment), animated: true, completion: nil)
        })
        editAction.backgroundColor = UIColor.lightGray
        
        let deleteAction = UITableViewRowAction(style: .default, title: "excluir", handler: { (action, indexPath) in
            let investment = self.investments[indexPath.row]
            self.context.delete(investment)
            do {
                try self.context.save()
            } catch {
                print("Unable to delete Investment model")
            }
        })
        
        return [editAction, deleteAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let asset = self.investments[indexPath.row]
        guard let _ = asset.brokerCode else {return}
        
        let viewController = AssetsDetailBuilder().builder(asset: asset)
        present(viewController, animated: true, completion: nil)
    }
    
    func updateTotalFunds() {
        totalFunds = InvestmentsManager.getTotalInvestmentsValue(investments: investments)
        if !balanceHidden {
            balanceLabel.text = "R$ \(totalFunds)"
        }
    }
}

extension AssetsViewController: NSFetchedResultsControllerDelegate {

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if let investment = anObject as? Investment {
            switch type {
            case .delete:
                let index = investments.firstIndex(where: { $0 == investment })
                if let index = index {
                    investments.remove(at: index)
                }
            case .move:
                print("Código para atualizar a posição o invesment da tabela")
            case .update:
                print("Código para atualizar o invesment da tabela")
            case .insert:
                investments.append(investment)
            @unknown default:
                print("Cenário desconhecido")
            }
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
        updateTotalFunds()
    }
}
