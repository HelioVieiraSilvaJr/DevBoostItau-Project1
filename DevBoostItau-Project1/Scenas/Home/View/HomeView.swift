//
//  HomeView.swift
//  DevBoostItau-Project1
//
//  Created by Matheus Pereira da Silva Souza on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func showBalance()
    func fundsContainer()
}

class HomeView: BaseView {
    
    weak var delegate: HomeViewDelegate?
    
    convenience init(delegate: HomeViewDelegate){
        self.init()
        self.delegate = delegate
        self.backgroundColor = UIColor.itiDarkGrey
    }
    
    let emptyProfileImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "emptyProfileImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.userName
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.seeMyProfile
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let divisionLine: UIView = {
        var lineView = UIView(frame: .zero)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .black
        lineView.alpha = 0.35
        return lineView
    }()
    
    let itiBalanceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.itiFunds
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fundsContainerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = .clear
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "R$ 0,00"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let showBalanceButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notVisibleEyeImage"), for: .normal)
        button.alpha = 0.65
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let profileRightArrowImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "rightArrowImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.65
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let fundsRightArrowImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "rightArrowImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.65
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 36)
        layout.itemSize = CGSize(width: 414, height: 338)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MenuCardCell.self, forCellWithReuseIdentifier: MenuCardCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    let aboutItiButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "upArrowCircleImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let aboutItiLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.everythingAboutYourIti
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func initialize() {
        addSubview(emptyProfileImage)
        addSubview(userNameLabel)
        addSubview(profileLabel)
        addSubview(divisionLine)
        addSubview(itiBalanceLabel)
        addSubview(profileRightArrowImage)
        addSubview(fundsContainerView)
        fundsContainerView.addSubview(balanceLabel)
        fundsContainerView.addSubview(showBalanceButton)
        fundsContainerView.addSubview(fundsRightArrowImage)
        addSubview(menuCollectionView)
        addSubview(aboutItiButton)
        addSubview(aboutItiLabel)
    }
    
    override func installConstraints() {
        emptyProfileImage.widthAnchor.constraint(equalToConstant: 87).isActive = true
        emptyProfileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        emptyProfileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        emptyProfileImage.leadingAnchor.constraint(equalTo: divisionLine.leadingAnchor, constant: -7).isActive = true
        
        userNameLabel.leadingAnchor.constraint(equalTo: emptyProfileImage.trailingAnchor, constant: 15).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: emptyProfileImage.centerYAnchor, constant: -13).isActive = true
        
        profileLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor, constant: 0).isActive = true
        profileLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 13).isActive = true

        divisionLine.leadingAnchor.constraint(equalTo: divisionLine.superview!.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        divisionLine.trailingAnchor.constraint(equalTo: divisionLine.superview!.layoutMarginsGuide.trailingAnchor, constant: -12).isActive = true
        divisionLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divisionLine.topAnchor.constraint(equalTo: emptyProfileImage.bottomAnchor, constant: 8).isActive = true
        
        itiBalanceLabel.leadingAnchor.constraint(equalTo: divisionLine.leadingAnchor, constant: 0).isActive = true
        itiBalanceLabel.topAnchor.constraint(equalTo: divisionLine.bottomAnchor, constant: 18).isActive = true
        
        profileRightArrowImage.centerYAnchor.constraint(equalTo: profileLabel.centerYAnchor, constant: 1).isActive = true
        profileRightArrowImage.leadingAnchor.constraint(equalTo: profileLabel.trailingAnchor, constant: 3).isActive = true
        profileRightArrowImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        profileRightArrowImage.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        fundsContainerView.topAnchor.constraint(equalTo: itiBalanceLabel.bottomAnchor, constant: 15).isActive = true
        fundsContainerView.leadingAnchor.constraint(equalTo: divisionLine.leadingAnchor, constant: 0).isActive = true
        fundsContainerView.trailingAnchor.constraint(equalTo: divisionLine.trailingAnchor, constant: 0).isActive = true
        fundsContainerView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        balanceLabel.leadingAnchor.constraint(equalTo: fundsContainerView.leadingAnchor, constant: 0).isActive = true
        balanceLabel.centerYAnchor.constraint(equalTo: fundsContainerView.centerYAnchor, constant: 0).isActive = true
        
        showBalanceButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        showBalanceButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        showBalanceButton.leadingAnchor.constraint(equalTo: balanceLabel.trailingAnchor, constant: 15).isActive = true
        showBalanceButton.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor, constant: 0).isActive = true
        
        fundsRightArrowImage.widthAnchor.constraint(equalToConstant: 21).isActive = true
        fundsRightArrowImage.heightAnchor.constraint(equalToConstant: 22).isActive = true
        fundsRightArrowImage.trailingAnchor.constraint(equalTo: fundsRightArrowImage.superview!.trailingAnchor, constant: 0).isActive = true
        fundsRightArrowImage.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor, constant: 0).isActive = true
        
        menuCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: fundsContainerView.bottomAnchor, constant: 20).isActive = true
        
        aboutItiButton.centerXAnchor.constraint(equalTo: aboutItiLabel.centerXAnchor, constant: 0).isActive = true
        aboutItiButton.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor, constant: 20).isActive = true
        aboutItiButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        aboutItiButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        aboutItiLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        aboutItiLabel.topAnchor.constraint(equalTo: aboutItiButton.bottomAnchor, constant: 2).isActive = true
        aboutItiLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 2).isActive = true
    }
    
    override func setupExtraConfigurations() {
        self.backgroundColor = .itiDarkGrey
        showBalanceButton.addTarget(self, action: #selector(showBalanceTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(fundsContainerTapped))
        fundsContainerView.addGestureRecognizer(tapGesture)
    }
    
    @objc func showBalanceTapped() {
        delegate?.showBalance()
    }
    
    @objc func fundsContainerTapped() {
        delegate?.fundsContainer()
    }

}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 168, height: 217)
    }
}
