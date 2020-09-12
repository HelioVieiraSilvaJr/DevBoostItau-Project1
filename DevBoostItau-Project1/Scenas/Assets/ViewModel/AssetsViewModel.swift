//
//  AssetsViewModel.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/12/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation
import CoreData

protocol AssetsViewModelDelegate {
    func fetchInvestment()
    func updateList()
}
class AssetsViewModel {
    private var investments: [Investment] = [] {
       didSet{
           investmentsDidUpdate?()
       }
   }
   
   var investmentsDidUpdate: (() -> Void)?
    
    private var context: NSManagedObjectContext
    
    var delegate: AssetsViewModelDelegate?
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    var count: Int {
        investments.count
    }
    
    func loadInvestments() {
        let fetchRequest: NSFetchRequest<Investment> = Investment.fetchRequest()
                let sortDescriptor = NSSortDescriptor(key: "purchaseDate", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                do {
                    investments = try context.fetch(fetchRequest)
                    delegate?.updateList()
//                    customView.tableView.reloadData()
//                    updateTotalFunds()
                } catch {
                    print("error")
                }
//                investmentManager.performFetch()
        delegate?.fetchInvestment()
    }
    
    func deleteInvestment(at indexPath: IndexPath) -> Void {
        let investment = getInvestment(at: indexPath)
        self.context.delete(investment)
        do {
            try self.context.save()
            investments.remove(at: indexPath.row)
        } catch {
            print("Unable to delete Investment model")
        }
        
    }
    
    func getInvestment(at indexPath: IndexPath) -> Investment {
        investments[indexPath.row]
    }
    
    func getTotalBalance() -> Double{
        return InvestmentsManager.getTotalInvestmentsValue(investments: investments)
    }
    
    func getInvestmentPercentFor(_ indexPath: IndexPath) -> Double{
        let allTotal = InvestmentsManager.getTotalInvestmentsValue(investments: investments)
        let currentTotal = InvestmentsManager.getInvestmentValue(investment: getInvestment(at: indexPath))
        let percent = 100 * currentTotal / allTotal
        return percent
    }
    
    func cellViewModelFor(indexPath: IndexPath) -> AssetCellViewModel{
        AssetCellViewModel(investment: getInvestment(at: indexPath))
    }

    
}
