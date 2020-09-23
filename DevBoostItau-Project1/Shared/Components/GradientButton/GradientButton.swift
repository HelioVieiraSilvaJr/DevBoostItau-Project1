//
//  GradientButton.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

enum GradientStyle {
    case horizontal, vertical
}

class GradientButton: UIButton {
    override func draw(_ rect: CGRect) {
        let colors = [UIColor.itiOrange, UIColor.itiPink]
        let style: GradientStyle = .horizontal
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = style == .horizontal ? CGPoint(x: 0, y: 0.5) : CGPoint(x: 0, y: 0)
        gradient.endPoint = style == .horizontal ? CGPoint(x: 1.0, y: 0.5) : CGPoint(x: 1, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }
}
