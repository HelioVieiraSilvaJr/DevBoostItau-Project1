//
//  HomeView.swift
//  DevBoostItau-Project1
//
//  Created by Matheus Pereira da Silva Souza on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class HomeView: BaseView, HasCodeView {
    
    typealias CustomView = HomeView
    
    let contentView: BaseView = {
        let contentView = BaseView(frame: .zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override func initialize() {
        
    }
    
    override func installConstraints() {
        
    }
    
    override func setupExtraConfigurations() {
        
    }

}
