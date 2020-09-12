//
//  File.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation
import CoreData

class InvestmentsManager {
    
    let context: NSManagedObjectContext
    weak var delegate: NSFetchedResultsControllerDelegate?
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    lazy var fetchedResultsController: NSFetchedResultsController<Investment> = {
        let fetchRequest: NSFetchRequest<Investment> = Investment.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "purchaseDate", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = delegate
        
        return fetchedResultsController
    }()
    
    func performFetch() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }
    
    var totalInvestments: Int {
        fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func getInvestmentAt(_ indexPath: IndexPath) -> Investment {
        fetchedResultsController.object(at: indexPath)
    }
    
    static func getTotalInvestmentsValue(investments: [Investment]) -> Double {
        var total = 0.0
        investments.forEach({total += Double($0.quantityOfStocks) * $0.purchasePrice})
        return total
    }
    
    static func getInvestmentValue(investment: Investment) -> Double {
        return Double(investment.quantityOfStocks) * investment.purchasePrice
    }
}
