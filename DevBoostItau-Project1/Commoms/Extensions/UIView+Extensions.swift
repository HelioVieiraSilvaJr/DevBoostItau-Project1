//
//  UIView+Extensions.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

extension UIView {
    func applyGradient(style: GradientStyle, colors: [UIColor]){
         let gradient: CAGradientLayer = CAGradientLayer()
         gradient.frame = self.bounds
         gradient.colors = colors.map { $0.cgColor }
         gradient.startPoint = style == .horizontal ? CGPoint(x: 0, y: 0.5) : CGPoint(x: 0, y: 0)
         gradient.endPoint = style == .horizontal ? CGPoint(x: 1.0, y: 0.5) : CGPoint(x: 1, y: 1)
         self.layer.insertSublayer(gradient, at: 0)
    }

    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
