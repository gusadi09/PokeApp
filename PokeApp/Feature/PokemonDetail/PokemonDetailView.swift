//
//  PokemonDetailView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @StateObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                viewModel.onFetchDetail()
            }
    }
}

#Preview {
    PokemonDetailView(viewModel: PokemonDetailViewModel(for: "0"))
}
