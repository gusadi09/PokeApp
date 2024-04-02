//
//  SpeciesResponse.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

struct SpeciesResponse: Codable, Equatable {
    let id: Int?
    let evolutionChain: Self.EvolutionChainResponse?
    
    struct EvolutionChainResponse: Codable, Equatable {
        let url: URL
        
        var id: String {
            return url.lastPathComponent
        }
    }
}
