//
//  EvolutionLinkResponse.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

struct EvolutionLinkResponse: Codable, Equatable {
    let id: Int
    let chain: ChainLinkResponse
    
    var list: [NameWrapperResponse] {
        getAllSpecies(from: chain)
    }
    
    private func getAllSpecies(from chainLink: ChainLinkResponse) -> [NameWrapperResponse] {
        var allSpecies = [chainLink.species]
        
        for nextLink in chainLink.evolvesTo {
            let nextSpecies = getAllSpecies(from: nextLink)
            allSpecies.append(contentsOf: nextSpecies)
        }
        
        return allSpecies
    }
}

struct ChainLinkResponse: Codable, Equatable {
    let species: NameWrapperResponse
    let evolvesTo: [ChainLinkResponse]
}
