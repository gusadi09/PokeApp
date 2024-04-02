//
//  PokemonDetailViewModel.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

final class PokemonDetailViewModel: ObservableObject {
    let pokeId: String
    @Published var pokemon: PokemonResponse?
    @Published var evolutions: EvolutionLinkResponse?
    @Published var phase: Phase = .initial
    @Published var isError: Bool = false
    
    private let pokemonRepository: PokemonRepository
    
    init(
        for pokeId: String,
        pokemonRepository: PokemonRepository = PokemonDefaultRepository()
    ) {
        self.pokeId = pokeId
        self.pokemonRepository = pokemonRepository
    }
    
    @MainActor
    func getPokemonDetails() async {
        phase = .loading
        isError = false
        
        do {
            let species = try await pokemonRepository.getSpecies(from: pokeId)
            pokemon = try await pokemonRepository.getDetails(from: pokeId)
            evolutions = try await pokemonRepository.getEvolutions(from: species.evolutionChain?.id ?? "")
        } catch {
            phase = .error(error.localizedDescription)
            isError = true
        }
        
        phase = .initial
    }
    
    func onFetchDetail() {
        Task {
            await getPokemonDetails()
        }
    }
}
