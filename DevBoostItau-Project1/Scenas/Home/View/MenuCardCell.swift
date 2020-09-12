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
    
    // MARK: - Outlets
    @IBOutlet weak var gradientBackground: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    
    // MARK: - Overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 8
        
        self.gradientBackground.backgroundColor = .clear
    }
    
    // MARK: - Methods
    func setupView(cardMenu: CardMenu) {
        self.titleLabel.text = cardMenu.title
        self.subtitleLabel.text = cardMenu.subtitle
        self.backImage.image = cardMenu.image
    }
}
