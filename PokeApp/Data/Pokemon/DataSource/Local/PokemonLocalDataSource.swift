//
//  PokemonLocalDataSource.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

protocol PokemonLocalDataSource {
    func getDetailPokemon(from id: String) -> PokemonResponse?
    func saveDetail(_ pokemon: PokemonResponse)
    func getSpecies(from id: String) -> SpeciesResponse?
    func saveSpecies(_ species: SpeciesResponse)
    func getEvolutions(from evoId: String) -> EvolutionLinkResponse?
    func saveEvolutions(_ link: EvolutionLinkResponse)
}
