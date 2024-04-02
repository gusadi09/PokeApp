//
//  PokemonDetailView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        ZStack {
            Color.pokeLight
                .ignoresSafeArea()
            
            if viewModel.isError {
                errorView()
            } else if viewModel.phase == .loading {
                ProgressView() {
                    Text("Fetching detail...")
                }
                .controlSize(.large)
                .tint(.pokePrimary)
            } else {
                VStack {
                    Divider()
                        .frame(height: 1)
                        .padding(.bottom, 3)
                    
                    segmentedView()
                    
                    swipedView()
                }
            }
        }
        .onAppear {
            viewModel.onFetchDetail()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                        Text((viewModel.pokemon?.name ?? "").capitalized)
                    }
                    .fontWeight(.semibold)
                }
                .tint(.pokePrimary)
            }
        }
        
    }
    
    @ViewBuilder
    func segmentedView() -> some View {
        Picker("", selection: $viewModel.segment) {
            Text("Overview")
                .tag(DetailTabState.overview)
            
            Text("Evolution")
                .tag(DetailTabState.evolution)
        }
        .pickerStyle(.segmented)
        .segmentColor(selected: .pokePrimary, selectedText: .white, text: .pokePrimary)
        .padding()
    }
    
    @ViewBuilder
    func swipedView() -> some View {
        TabView(selection: $viewModel.segment) {
            overview()
                .foregroundStyle(.black)
                .tag(DetailTabState.overview)
            
            evolutionList()
                .foregroundStyle(.black)
                .tag(DetailTabState.evolution)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    PokemonDetailView(viewModel: PokemonDetailViewModel(for: "0"))
}
