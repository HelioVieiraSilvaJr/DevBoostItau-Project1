//
//  String+Extensions.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

extension String {

    func dateFormat(inputFormat: String, outputFormat: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat

        let dateIn = inputFormatter.date(from: self)
        let dateOut = outputFormatter.string(from: dateIn ?? Date())
        
        return dateOut
    }
}
