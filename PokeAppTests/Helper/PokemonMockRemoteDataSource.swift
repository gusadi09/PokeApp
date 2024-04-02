//
//  MockPokemonHelperRepository.swift
//  PokeAppTests
//
//  Created by Gus Adi on 03/04/24.
//

import Alamofire
import Foundation
import Mocker
@testable import PokeApp

final class PokemonMockRemoteDataSource: PokemonRemoteDataSource {
    private let baseUrl = "https://pokeapi.co/api/v2"
    private let session: Session
    
    init(session: Session) {
        self.session = session
    }
    
    func getPokemons(on page: Int) async throws -> [PokeApp.NameWrapperResponse] {
        let endpoint = URL(string: "\(baseUrl)/pokemon?offset=\((page / 20) * 20)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(ListResponse(results: MockDataHelper.mockedPokemonNameWrapper))
        
        let mockRegistry = Mock(url: endpoint, contentType: .json, statusCode: 200, data: [.get: mockedData])
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
    
    func failGetPokemons(on page: Int) async throws -> [PokeApp.NameWrapperResponse] {
        let endpoint = URL(string: "\(baseUrl)/pokemon?offset=\((page / 20) * 20)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(ListResponse(results: MockDataHelper.mockedPokemonNameWrapper))
        
        let mockRegistry = Mock(
            url: endpoint,
            contentType: .json,
            statusCode: 500,
            data: [.get: mockedData],
            requestError: MockDataHelper.ErrorSample(message: "Internal Server Error")
        )
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
    
    func getDetail(from id: String) async throws -> PokeApp.PokemonResponse {
        let endpoint = URL(string: "\(baseUrl)/pokemon/\(id)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(MockDataHelper.mockedDetailPokemon)
        
        let mockRegistry = Mock(url: endpoint, contentType: .json, statusCode: 200, data: [.get: mockedData])
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
    
    func failGetDetail(from id: String) async throws -> PokeApp.PokemonResponse {
        let endpoint = URL(string: "\(baseUrl)/pokemon/\(id)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(MockDataHelper.mockedDetailPokemon)
        
        let mockRegistry = Mock(
            url: endpoint,
            contentType: .json,
            statusCode: 500,
            data: [.get: mockedData],
            requestError: MockDataHelper.ErrorSample(message: "Internal Server Error")
        )
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
    
    func getSpecies(from id: String) async throws -> PokeApp.SpeciesResponse {
        let endpoint = URL(string: "\(baseUrl)/pokemon-species/\(id)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(MockDataHelper.mockedSpecies)
        
        let mockRegistry = Mock(url: endpoint, contentType: .json, statusCode: 200, data: [.get: mockedData])
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
    
    func failGetSpecies(from id: String) async throws -> PokeApp.SpeciesResponse {
        let endpoint = URL(string: "\(baseUrl)/pokemon-species/\(id)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(MockDataHelper.mockedSpecies)
        
        let mockRegistry = Mock(
            url: endpoint,
            contentType: .json,
            statusCode: 500,
            data: [.get: mockedData],
            requestError: MockDataHelper.ErrorSample(message: "Internal Server Error")
        )
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
    
    func getEvolutions(with evoId: String) async throws -> PokeApp.EvolutionLinkResponse {
        let endpoint = URL(string: "\(baseUrl)/evolution-chain/\(evoId)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(MockDataHelper.mockedSpecies)
        
        let mockRegistry = Mock(url: endpoint, contentType: .json, statusCode: 200, data: [.get: mockedData])
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
    
    func failGetEvolutions(with evoId: String) async throws -> PokeApp.EvolutionLinkResponse {
        let endpoint = URL(string: "\(baseUrl)/evolution-chain/\(evoId)") ?? (NSURL() as URL)
        
        let mockedData = try JSONEncoder().encode(MockDataHelper.mockedSpecies)
        
        let mockRegistry = Mock(
            url: endpoint,
            contentType: .json,
            statusCode: 500,
            data: [.get: mockedData],
            requestError: MockDataHelper.ErrorSample(message: "Internal Server Error")
        )
        
        mockRegistry.register()
        
        let result = await session
            .request(endpoint)
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
