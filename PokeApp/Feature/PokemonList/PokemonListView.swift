//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject var viewModel = PokemonListViewModel()
    
    private let columns = [GridItem(.flexible(minimum: 157)), GridItem(.flexible(minimum: 157))]
    
    var body: some View {
        ZStack {
            Color.pokeLight
                .ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(viewModel.pokemons) { poke in
                        PokeItemView(of: poke)
                    }
                    
                    Color.clear.onAppear {
                        viewModel.onFetchPokemon()
                    }
                })
                
                if !viewModel.pokemons.isEmpty {
                    nextPageView()
                }
            }
            .refreshable {
                viewModel.pokemons = []
                await viewModel.getPokemons()
            }
            
            if viewModel.pokemons.isEmpty {
                if viewModel.phase == .loading {
                    ProgressView() {
                        Text("Getting pokemons...")
                    }.controlSize(.large)
                } else if viewModel.isError && viewModel.phase != .loading {
                    errorView()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(for: String.self) { poke in
            Text("Detail of \(poke)")
        }
    }
    
    @ViewBuilder
    private func nextPageView() -> some View {
        ZStack(alignment: .center) {
            if viewModel.phase == .loading {
                ProgressView().controlSize(.regular)
            } else {
                EmptyView()
            }
        }
    }
    
    @ViewBuilder
    private func errorView() -> some View {
        VStack {
            Spacer()
            
            Image(systemName: "xmark.icloud")
                .foregroundStyle(.pokePrimary)
                .font(.system(size: 85))
            
            Text("Oops... something went wrong").padding()
            
            Button {
                viewModel.onFetchPokemon()
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "arrow.clockwise")
                    
                    Text("Retry")
                        .fontWeight(.semibold)
                }
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(
                        cornerRadius: 20,
                        style: .continuous
                    )
                    .fill(.pokePrimary)
                )
            }
            
            Spacer()
        }
    }
}

#Preview {
    PokemonListView()
}
