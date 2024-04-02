//
//  PokemonRemoteDataSource.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

protocol PokemonRemoteDataSource {
    func getPokemons(on page: Int) async throws -> [NameWrapperResponse]
    func getDetail(from id: String) async throws -> PokemonResponse
    func getSpecies(from id: String) async throws -> SpeciesResponse
    func getEvolutions(with evoId: String) async throws -> EvolutionLinkResponse
}
