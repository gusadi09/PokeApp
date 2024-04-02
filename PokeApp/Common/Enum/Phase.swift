//
//  Phase.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

enum Phase {
    case initial
    case loading
    case error(String)
    case finished
}

extension Phase {
    var errorString: String {
        switch self {
        case .error(let error):
            return error
        default:
            return ""
        }
    }
}
