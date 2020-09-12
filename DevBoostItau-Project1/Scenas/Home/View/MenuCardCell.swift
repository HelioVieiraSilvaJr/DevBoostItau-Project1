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
    
    let gradientBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Investir"
        label.textColor = .itiGrey
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Investir"
        label.textColor = .itiGrey
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Outlets
//    @IBOutlet weak var gradientBackground: UIView!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var subtitleLabel: UILabel!
//    @IBOutlet weak var backImage: UIImageView!
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 8
        
        self.gradientBackground.backgroundColor = .clear
        
        addSubview(gradientBackground)
        gradientBackground.addSubview(titleLabel)
        gradientBackground.addSubview(subtitleLabel)
        
        gradientBackground.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        gradientBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        gradientBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        gradientBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        subtitleLabel.bottomAnchor.constraint(equalTo: gradientBackground.bottomAnchor, constant: Margin.vertical).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: gradientBackground.leadingAnchor, constant: Margin.horizontal).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: gradientBackground.trailingAnchor, constant: Margin.horizontal).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: Margin.vertical).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor, constant: Margin.horizontal).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor, constant: Margin.horizontal).isActive = true
        
    }
    
    // MARK: - Methods
    func setupView(cardMenu: CardMenu) {
//        self.titleLabel.text = cardMenu.title
//        self.subtitleLabel.text = cardMenu.subtitle
//        self.backImage.image = cardMenu.image
        
    }
}
