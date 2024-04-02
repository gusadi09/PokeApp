//
//  EvolutionLink.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation
import SwiftData

@Model
class EvolutionLink {
    var id: Int
    var chain: ChainLink?
    
    init(id: Int, chain: ChainLink? = nil) {
        self.id = id
        self.chain = chain
    }
}

@Model
class ChainLink {
    var species: NameWrapper?
    var evolvesTo: [ChainLink]
    
    init(species: NameWrapper? = nil, evolvesTo: [ChainLink]) {
        self.species = species
        self.evolvesTo = evolvesTo
    }
}
