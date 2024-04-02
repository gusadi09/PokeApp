//
//  PokemonDefaultRemoteDataSource.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Alamofire
import Foundation

final class PokemonDefaultRemoteDataSource: PokemonRemoteDataSource {
    
    private let baseUrl = "https://pokeapi.co/api/v2"
    
    private let session: Session
    
    init(session: Session = Session()) {
        self.session = session
    }
    
    func getPokemons(on page: Int) async throws -> [NameWrapperResponse] {
        let result = await session
            .request("\(baseUrl)/pokemon?offset=\((page / 20) * 20)")
            .serializingDecodable(
                ListResponse<NameWrapperResponse>.self,
                decoder: JSONDecoder.decoder(with: .convertFromSnakeCase)
            ).result
        
        switch result {
        case .success(let response):
            return response.results ?? []
        case .failure(let error):
            throw error
        }
    }
    
    func getDetail(from id: String) async throws -> PokemonResponse {
        let result = await session
            .request("\(baseUrl)/pokemon/\(id)")
            .serializingDecodable(
                PokemonResponse.self,
                decoder: JSONDecoder.decoder(with: .convertFromSnakeCase)
            ).result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    func getSpecies(from id: String) async throws -> SpeciesResponse {
        let result = await session
            .request("\(baseUrl)/pokemon-species/\(id)")
            .serializingDecodable(
                SpeciesResponse.self,
                decoder: JSONDecoder.decoder(with: .convertFromSnakeCase)
            ).result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    func getEvolutions(with evoId: String) async throws -> EvolutionLinkResponse {
        let result = await session
            .request("\(baseUrl)/evolution-chain/\(evoId)")
            .serializingDecodable(
                EvolutionLinkResponse.self,
                decoder: JSONDecoder.decoder(with: .convertFromSnakeCase)
            ).result
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
}
