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
    lazy var viewModel: HomeViewModel = {
        return HomeViewModel(context: self.context)
    }()
    var menuCards: [CardMenu]?
    weak var coordinator: HomeCoordinator?
    
    var navigationTitleImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "itiLogoImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Overrides
    
    override func loadView() {
        view = HomeView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupMenuCards()
        setupDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customView.balanceLabel.text = viewModel.getBalance()
    }
    
    // MARK: Methods
    func setupNavigationBar() {
        navigationItem.titleView = navigationTitleImageView
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icQrCode")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icSettings")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: .plain, target: self, action: nil)
    }
    
    func setupMenuCards() {
        let investCard = CardMenu(title: Localization.invest,
                                  subtitle: Localization.yourMoney,
                                  image: UIImage(named: "money"))
        let signupCard = CardMenu(title: Localization.signUp,
                                  subtitle: Localization.card,
                                  image: UIImage(named: "card"))
        let helpCard = CardMenu(title: Localization.askForHelp,
                                subtitle: Localization.speakWithAnAssistant,
                                image: UIImage(named: "question"))
        menuCards = [investCard, signupCard, helpCard]
    }
    
    func setupDelegates() {
        customView.menuCollectionView.dataSource = self
    }
}

extension HomeViewController: HomeViewDelegate {
    func balanceVisibilityTapped() {
        viewModel.balanceVisible.toggle()
        customView.balanceLabel.text = viewModel.getBalance()
    }
    
    func fundsContainerTapped() {
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
