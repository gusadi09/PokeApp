//
//  PokemonDefaultLocalDataSource.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

final class PokemonDefaultLocalDataSource: PokemonLocalDataSource {
    func getDetailPokemon(from id: String) -> PokemonResponse? {
        nil
    }
    
    func saveDetail(_ pokemon: PokemonResponse) {
        
    }
    
    func getSpecies(from id: String) -> SpeciesResponse? {
        nil
    }
    
    func saveSpecies(_ species: SpeciesResponse) {
        
    }
    
    func getEvolutions(from evoId: String) -> EvolutionLinkResponse? {
        nil
    }
    
    func saveEvolutions(_ link: EvolutionLinkResponse) {
        
    }
}
