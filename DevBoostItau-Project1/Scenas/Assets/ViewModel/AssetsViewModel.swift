//
//  AssetsViewModel.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/12/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation
import CoreData

class AssetsViewModel: NSObject {
    private var investments: [Investment] = [] {
       didSet {
           investmentsDidUpdate?()
       }
   }
   
   var investmentsDidUpdate: (() -> Void)?
    
    private var context: NSManagedObjectContext
    
    lazy var investmentManager: InvestmentsManager = {[weak self] in
        let investmentManager = InvestmentsManager(context: context)
        investmentManager.delegate = self
        return investmentManager
    }()
    
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
        } catch {
            print("error")
        }
        investmentManager.performFetch()
    }
    
    func deleteInvestment(at indexPath: IndexPath) -> Void {
        let investment = getInvestment(at: indexPath)
        self.context.delete(investment)
        do {
            try self.context.save()
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

    func getAssetViewModelFor(_ indexPath: IndexPath) -> AssetsDetailViewModel{
        return AssetsDetailViewModel(asset: AssetModel(from: getInvestment(at: indexPath)))
    }
}

extension AssetsViewModel: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
            if let investment = anObject as? Investment {
                switch type {
                case .delete:
                    print("Código para atualizar a posição o invesment da tabela")
                    let index = investments.firstIndex(where: { $0 == investment })
                    if let index = index {
                        investments.remove(at: index)
                    }
                case .move:
                    print("Código para atualizar a posição o invesment da tabela")
                case .update:
                    print("Código para atualizar o invesment da tabela")
                case .insert:
                    print("Código para atualizar o invesment da tabela")
                    investments.append(investment)
                @unknown default:
                    print("Cenário desconhecido")
                }
            }
        }
        
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        investmentsDidUpdate?()
    }
}
