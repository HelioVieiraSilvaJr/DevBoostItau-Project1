//
//  ApiError.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/23/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL
    case taskError
    case noResponse
    case invalidStatusCode(Int)
    case noData
    case invalidJSON
    case error(String)
    
    var errorMessage: String {
        switch self {
        case .badURL:
            return "URL inválida"
        default:
            return ""
        }
    }
}
