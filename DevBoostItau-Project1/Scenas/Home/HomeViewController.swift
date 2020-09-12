//
//  HomeViewController.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: Properties
    let viewModel = HomeViewModel()
    var menuCards: [CardMenu]?
    var backImages = [UIImage(named: "money"), UIImage(named: "card"), UIImage(named: "question")]
    weak var coordinator: HomeCoordinator?
    
    // MARK: Outlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var totalInvestmentsLabel: UILabel!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var fundsContainerView: UIView!
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupMenuCards()
        setupView()
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
        let investCard = CardMenu(title: "investir", subtitle: "seu dinheiro")
        let signupCard = CardMenu(title: "cadastrar", subtitle: "cartão")
        let helpCard = CardMenu(title: "pedir ajuda", subtitle: "fale com um assistente")
        menuCards = [investCard, signupCard, helpCard]
    }
    
    func setupView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapFundsSegue))
        fundsContainerView.addGestureRecognizer(tapGesture)

    }
    
    func setupDelegates() {
        menuCollectionView.dataSource = self
    }
    
    // MARK: Actions
    @objc func didTapFundsSegue() {
        performSegue(withIdentifier: "AssetsSegue", sender: nil)
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
            cell.setupView(cardMenu: cardMenu, backImage: backImages[indexPath.row])
        }
        
        return cell
    }
}
