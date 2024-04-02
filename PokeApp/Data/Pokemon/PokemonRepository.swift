//
//  PokemonRepository.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

protocol PokemonRepository {
    func getPokemons(on page: Int) async throws -> [NameWrapperResponse]
    func getDetails(from id: String) async throws -> PokemonResponse
    func getSpecies(from id: String) async throws -> SpeciesResponse
    func getEvolutions(from evolutionId: String) async throws -> EvolutionLinkResponse
}
