//
//  PokeItemView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct PokeItemView: View {
    private let pokemon: NameWrapperResponse
    
    init(of pokemon: NameWrapperResponse) {
        self.pokemon = pokemon
    }
    
    init(of pokemon: NameWrapper) {
        self.init(
            of: NameWrapperResponse(
                name: pokemon.name,
                url: URL(string: pokemon.url) ?? (NSURL() as URL))
        )
    }
    
    var body: some View {
        NavigationLink(value: pokemon.id) {
            ContainerView(
                style: .pokeLight,
                bgColor: .pokePrimary
            ) {
                VStack {
                    WebImage(url: pokemon.imageUrl).indicator(.activity)
                    Text((pokemon.name ?? "???").capitalized + " #\(pokemon.id)").fontWeight(.semibold)
                }.frame(width: 157, height: 157)
            }
        }
    }
}

#Preview {
    PokeItemView(of: NameWrapperResponse(name: "Preview", url: nil))
}
