//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        ZStack {
            Text("Hello, World!")
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PokemonListView()
}
