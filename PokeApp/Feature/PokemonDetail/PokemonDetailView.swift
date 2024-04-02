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
}

#Preview {
    PokemonDetailView(viewModel: PokemonDetailViewModel(for: "0"))
}
