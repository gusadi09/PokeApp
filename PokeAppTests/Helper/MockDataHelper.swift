//
//  MockDataHelper.swift
//  PokeAppTests
//
//  Created by Gus Adi on 03/04/24.
//

import Foundation
@testable import PokeApp

struct MockDataHelper {
    static let mockedPokemonNameWrapper = [NameWrapperResponse(name: "Pikachu", url: URL(string: "https://pokeapi.co/api/v2") ?? (NSURL() as URL))]
    
    static let mockedDetailPokemon = PokemonResponse(
        id: 0,
        name: "Pikachu",
        height: 100,
        weight: 100,
        stats: [
            StatResponse(baseStat: 10, stat: NameWrapperResponse(name: "Attack", url: nil))
        ], 
        types: [
            PokemonTypeResponse(slot: 1, type: NameWrapperResponse(name: "Electric", url: nil))
        ]
    )
    
    static let mockedSpecies = SpeciesResponse(
        id: 0,
        evolutionChain: SpeciesResponse.EvolutionChainResponse(
            url: URL(string: "https://pokeapi.co/api/v2") ?? (NSURL() as URL)
        )
    )
    
    static let mockedEvolutions = EvolutionLinkResponse(
        id: 0,
        chain: ChainLinkResponse(
            species: NameWrapperResponse(
                name: "Bulbasaur", 
                url: URL(string: "https://pokeapi.co/api/v2") ?? (NSURL() as URL)
            ),
            evolvesTo: [
                ChainLinkResponse(
                    species: NameWrapperResponse(
                        name: "Ivysaur",
                        url: URL(string: "https://pokeapi.co/api/v2") ?? (NSURL() as URL)
                    ),
                    evolvesTo: nil
                )
            ]
        )
    )
    
    struct ErrorSample: Error {
        let message: String?
    }
}
