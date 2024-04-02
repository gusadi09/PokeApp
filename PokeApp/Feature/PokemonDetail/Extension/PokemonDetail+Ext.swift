//
//  PokemonDetail+Ext.swift
//  PokeApp
//
//  Created by Gus Adi on 03/04/24.
//

import SDWebImageSwiftUI
import SwiftUI

extension PokemonDetailView {
    @ViewBuilder
    func overview() -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                profileCard()
                    .padding(.bottom, 18)
                
                Text("Stats")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(.pokePrimary)
                
                Divider()
                    .frame(height: 1)
                    .padding(.top, 5)
                    .padding(.bottom, 18)
                
                VStack(spacing: 25, content: {
                    sectionedCard(section: "Attack", value: viewModel.pokemon?.attack() ?? "???")
                    
                    sectionedCard(section: "HP", value: viewModel.pokemon?.healthProgress() ?? "???")
                    
                    sectionedCard(section: "Defense", value: viewModel.pokemon?.defense() ?? "???")
                    
                    sectionedCard(section: "Speed", value: viewModel.pokemon?.speed() ?? "???")
                })
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func profileCard() -> some View {
        HStack(alignment: .center, spacing: 15, content: {
            WebImage(url: viewModel.pokemon?.imageUrl())
                .resizable()
                .indicator(.activity)
                .scaledToFit()
                .frame(width: 77)
                .padding(.leading, 20)
            
            Rectangle()
                .frame(width: 1, height: 77)
                .foregroundStyle(.white)
            
            VStack(alignment: .leading) {
                Text((viewModel.pokemon?.name ?? "???").capitalized)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.bottom, 12)
                
                Text("Type : \(viewModel.pokemon?.allTypesString() ?? "???")")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                
                Text("Height : \(viewModel.pokemon?.meterHeight() ?? "???")m")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
                
                Text("Weight : \(viewModel.pokemon?.kgWeight() ?? "???")Kg")
                    .font(.system(size: 12))
                    .foregroundStyle(.white)
            }
            
            Spacer()
        })
        .padding(.vertical, 35)
        .padding(.horizontal, 25)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.pokePrimary)
        )
    }
    
    @ViewBuilder
    func sectionedCard(section: String, value: String) -> some View {
        HStack {
            Text("\(section) :")
                .font(.system(size: 12))
                .foregroundStyle(.white)
            
            Spacer()
            
            Text(value)
                .font(.system(size: 12))
                .foregroundStyle(.white)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.pokePrimary)
        )
    }
    
    @ViewBuilder
    func evolutionList() -> some View {
        
    }
}
