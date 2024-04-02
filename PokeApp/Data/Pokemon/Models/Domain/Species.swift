//
//  Species.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation
import SwiftData

@Model
class Species {
    var specId: Int
    var evolutionChain: SpeciesEvolutionChain?
    
    init(specId: Int, evolutionChain: SpeciesEvolutionChain? = nil) {
        self.specId = specId
        self.evolutionChain = evolutionChain
    }
}

@Model
class SpeciesEvolutionChain {
    var url: String
    
    init(url: String) {
        self.url = url
    }
}
