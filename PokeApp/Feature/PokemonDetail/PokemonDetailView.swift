//
//  PokemonDetailView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @StateObject var viewModel = PokemonDetailViewModel()
    let id: String
    
    init(
        id: String
    ) {
        self.id = id
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    PokemonDetailView(id: "0")
}
