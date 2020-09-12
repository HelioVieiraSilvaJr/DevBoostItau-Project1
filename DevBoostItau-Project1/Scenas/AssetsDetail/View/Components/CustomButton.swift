//
//  CustomButton.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class CustomButton: GradientButton {
    
    var title: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.title = title
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        
        setTitleColor(.white, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius = 25
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
