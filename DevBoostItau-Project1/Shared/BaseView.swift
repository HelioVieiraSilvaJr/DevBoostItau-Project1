//
//  BaseView.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/12/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    required public init() {
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    func initialize() { fatalError("Must be overridden") }
    
    func installConstraints() { fatalError("Must be overridden") }
    
    func setupExtraConfigurations() {}
    
    // MARK: Private
    fileprivate func setup() {
        self.initialize()
        self.installConstraints()
        self.setupExtraConfigurations()
    }
}

