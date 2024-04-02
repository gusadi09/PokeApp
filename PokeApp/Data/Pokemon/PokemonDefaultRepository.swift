//
//  PokemonDefaultRepository.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

final class PokemonDefaultRepository: PokemonRepository {
    
    private let remoteDataSource: PokemonRemoteDataSource
    private let localDataSource: PokemonLocalDataSource
    
    init(
        remoteDataSource: PokemonRemoteDataSource = PokemonDefaultRemoteDataSource(),
        localDataSource: PokemonLocalDataSource = PokemonDefaultLocalDataSource()
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func getPokemons(on page: Int = 0) async throws -> [NameWrapperResponse] {
        try await remoteDataSource.getPokemons(on: page)
    }
    
    func getDetails(from id: String) async throws -> PokemonResponse {
        if let pokemon = localDataSource.getDetailPokemon(from: id) {
            return pokemon
        } else {
            let response = try await remoteDataSource.getDetail(from: id)
            localDataSource.saveDetail(response)
            return response
        }
    }
    
    func getSpecies(from id: String) async throws -> SpeciesResponse {
        if let species = localDataSource.getSpecies(from: id) {
            return species
        } else {
            let response = try await remoteDataSource.getSpecies(from: id)
            localDataSource.saveSpecies(response)
            return response
        }
    }
    
    func getEvolutions(from evolutionId: String) async throws -> EvolutionLinkResponse {
        if let evolutions = localDataSource.getEvolutions(from: evolutionId) {
            return evolutions
        } else {
            let response = try await remoteDataSource.getEvolutions(with: evolutionId)
            localDataSource.saveEvolutions(response)
            return response
        }
    }
}
