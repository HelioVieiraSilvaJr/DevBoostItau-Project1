//
//  MenuCardCell.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class MenuCardCell: UICollectionViewCell {
    
    static let identifier = "MenuCardCell"
    
    let titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "System.Semibold", size: 17)
        label.textColor = .white
        return label
    }()
    
    let subtitleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "System.Medium", size: 13)
        label.textColor = .white
        return label
    }()
    
    let backImage: UIImageView = {
        var image = UIImageView(frame: .zero)
        image.alpha = 0.5
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    let containerView: UIView = {
        var view = UIView(frame: .zero)
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Overrides
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 8
        
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(backImage)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setupView(cardMenu: CardMenu) {
        self.titleLabel.text = cardMenu.title
        self.subtitleLabel.text = cardMenu.subtitle
        self.backImage.image = cardMenu.image
    }
    
    func setupConstraints() {
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        subtitleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.superview!.bottomAnchor, constant: -8).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.superview!.leadingAnchor, constant: 8).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: subtitleLabel.superview!.trailingAnchor, constant: 8).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -4).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: titleLabel.superview!.trailingAnchor, constant: 8).isActive = true
        
        backImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        backImage.heightAnchor.constraint(equalToConstant: 148).isActive = true
        backImage.trailingAnchor.constraint(equalTo: backImage.superview!.trailingAnchor, constant: 43).isActive = true
        backImage.leadingAnchor.constraint(equalTo: backImage.superview!.leadingAnchor, constant: 51).isActive = true
        backImage.topAnchor.constraint(equalTo: backImage.superview!.topAnchor, constant: -36.5).isActive = true
    }
}
