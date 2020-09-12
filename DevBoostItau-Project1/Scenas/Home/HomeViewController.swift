//
//  HomeViewController.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit
import CoreData

final class HomeViewController: BaseViewController, HasCodeView {
    
    typealias CustomView = HomeView
    
    // MARK: Properties
    let viewModel = HomeViewModel()
    var menuCards: [CardMenu]?
    var backImages = [UIImage(named: "money"), UIImage(named: "card"), UIImage(named: "question")]
    weak var coordinator: HomeCoordinator?
    
    override func loadView() {
        view = HomeView(delegate: self)
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupMenuCards()
        setupDelegates()
    }
    
    // MARK: Mathods
    func setupNavigationBar(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func setupMenuCards() {
        let investCard = CardMenu(title: "investir", subtitle: "seu dinheiro", image: UIImage(named: "money"))
        let signupCard = CardMenu(title: "cadastrar", subtitle: "cartão", image: UIImage(named: "card"))
        let helpCard = CardMenu(title: "pedir ajuda", subtitle: "fale com um assistente", image: UIImage(named: "question"))
        menuCards = [investCard, signupCard, helpCard]
    }
    
    func setupDelegates() {
        customView.menuCollectionView.dataSource = self
    }
    
}

extension HomeViewController: HomeViewDelegate {
    func showBalance() {
        let fetchRequest: NSFetchRequest<Investment> = Investment.fetchRequest()
        do {
            let investments = try context.fetch(fetchRequest)
            let total = InvestmentsManager.getTotalInvestmentsValue(investments: investments)
            customView.balanceLabel.text = "R$ \(total)"
        } catch {
           print("error")
        }
    }
    
    func fundsContainer() {
        coordinator?.showAssetsList()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let menuCards = menuCards {
            return menuCards.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCardCell.identifier, for: indexPath) as! MenuCardCell
        if let cards = menuCards {
            let cardMenu = cards[indexPath.row]
            cell.setupView(cardMenu: cardMenu)
        }
        
        return cell
    }
}
