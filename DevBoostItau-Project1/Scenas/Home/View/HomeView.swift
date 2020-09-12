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
    }
    
    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.backgroundColor = .blue
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
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
        label.textColor = UIColor.white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.seeMyProfile
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let divisionLine: UIView = {
        var lineView = UIView(frame: CGRect(x: 30, y: 276, width: 352, height: 1))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        return lineView
    }()
    
    let itiBalanceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.itiFunds
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fundsContainerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.backgroundColor = .blue
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let balanceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "R$ 0,00"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.white
        label.alpha = 0.65
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let showBalanceButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "notVisibleEyeImage"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let rightArrowImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "rightArrowImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0.65
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let menuCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 414, height: 338)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MenuCardCell.self, forCellWithReuseIdentifier: MenuCardCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.itiGrey
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
//        addSubview(contentView)
        addSubview(emptyProfileImage)
        addSubview(userNameLabel)
        addSubview(profileLabel)
        addSubview(divisionLine)
        addSubview(itiBalanceLabel)
        addSubview(fundsContainerView)
        fundsContainerView.addSubview(balanceLabel)
        fundsContainerView.addSubview(showBalanceButton)
        fundsContainerView.addSubview(rightArrowImage)
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

        divisionLine.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: divisionLine.trailingAnchor, constant: 12).isActive = true
        divisionLine.topAnchor.constraint(equalTo: emptyProfileImage.bottomAnchor, constant: 8).isActive = true
        
        itiBalanceLabel.leadingAnchor.constraint(equalTo: divisionLine.leadingAnchor, constant: 0).isActive = true
        itiBalanceLabel.topAnchor.constraint(equalTo: divisionLine.bottomAnchor, constant: 18).isActive = true
        
        rightArrowImage.centerYAnchor.constraint(equalTo: profileLabel.centerYAnchor, constant: 1).isActive = true
        rightArrowImage.leadingAnchor.constraint(equalTo: profileLabel.trailingAnchor, constant: 3).isActive = true
        rightArrowImage.widthAnchor.constraint(equalToConstant: 21).isActive = true
        rightArrowImage.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        fundsContainerView.topAnchor.constraint(equalTo: itiBalanceLabel.bottomAnchor, constant: 15).isActive = true
        fundsContainerView.leadingAnchor.constraint(equalTo: divisionLine.leadingAnchor, constant: 0).isActive = true
        fundsContainerView.trailingAnchor.constraint(equalTo: divisionLine.trailingAnchor, constant: 0).isActive = true
        fundsContainerView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        showBalanceButton.widthAnchor.constraint(equalToConstant: 37).isActive = true
        showBalanceButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        menuCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: fundsContainerView.bottomAnchor, constant: 20).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 190).isActive = true
        
        aboutItiButton.centerXAnchor.constraint(equalTo: aboutItiLabel.centerXAnchor, constant: 0).isActive = true
        aboutItiButton.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor, constant: 20).isActive = true
        
        aboutItiLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        aboutItiLabel.topAnchor.constraint(equalTo: aboutItiButton.bottomAnchor, constant: 2).isActive = true
    }
    
    override func setupExtraConfigurations() {
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
