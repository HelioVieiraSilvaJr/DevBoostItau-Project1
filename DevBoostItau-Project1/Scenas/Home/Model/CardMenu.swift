//
//  CardMenu.swift
//  DevBoostItau-Project1
//
//  Created by Gabriel den Hartog on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

struct CardMenu {
    
    var title: String
    var subtitle: String
    var image: UIImage?
    
    init(title: String, subtitle: String, image: UIImage?) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
