//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

final class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [NameWrapperResponse] = []
    @Published var phase: Phase = .initial
    @Published var isError: Bool = false
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository = PokemonDefaultRepository()) {
        self.pokemonRepository = pokemonRepository
    }
    
    @MainActor
    func getPokemons() async {
        phase = .loading
        isError = false
        
        do {
            pokemons.appendWithoutDuplicate(try await pokemonRepository.getPokemons(page: pokemons.count / 20))
            
            phase = .initial
        } catch {
            isError = true
        }
    }
    
    func onFetchPokemon() {
        Task {
            await getPokemons()
        }
    }
}
