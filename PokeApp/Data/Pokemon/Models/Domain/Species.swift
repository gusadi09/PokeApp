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
    var id: Int
    var evolutionChain: SpeciesEvolutionChain?
    
    init(id: Int, evolutionChain: SpeciesEvolutionChain? = nil) {
        self.id = id
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
