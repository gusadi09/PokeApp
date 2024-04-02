//
//  PokemonRepository.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

protocol PokemonRepository {
    func getPokemons(page: Int) async throws -> [NameWrapperResponse]
    func getDetails(id: String) async throws -> PokemonResponse
    func getSpecies(id: String) async throws -> SpeciesResponse
    func getEvolutions(evolutionId: String) async throws -> EvolutionLinkResponse
}
