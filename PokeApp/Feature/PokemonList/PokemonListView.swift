//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var viewModel = PokemonListViewModel()
    
    private let columns = [GridItem(.flexible(minimum: 157)), GridItem(.flexible(minimum: 157))]
    
    var body: some View {
        ZStack {
            Color.pokeLight
                .ignoresSafeArea()
            
            
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(0...5, id: \.self) { _ in
                        PokeItemView()
                    }
                    
                    Color.clear.onAppear {
                        
                    }
                })
                
                if !viewModel.pokemons.isEmpty {
                    nextPageView()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    private func nextPageView() -> some View {
        ZStack(alignment: .center) {
            if viewModel.phase == .loading {
                ProgressView().controlSize(.regular)
            } else {
                EmptyView()
            }
        }
    }
}

#Preview {
    PokemonListView()
}
