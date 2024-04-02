//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

final class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [String] = []
    @Published var phase: Phase = .initial
    @Published var isError: Bool = false
}
