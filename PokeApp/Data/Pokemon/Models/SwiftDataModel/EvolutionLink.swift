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
    var evoId: Int
    var chain: ChainLink?
    
    init(evoId: Int, chain: ChainLink? = nil) {
        self.evoId = evoId
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
