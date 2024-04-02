//
//  PokeItemView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct PokeItemView: View {
    var body: some View {
        NavigationLink(value: Route.detail) {
            ContainerView(
                style: .pokeLight,
                bgColor: .pokePrimary
            ) {
                VStack {
                    WebImage(url: URL(string: "")).indicator(.activity)
                    Text("").fontWeight(.semibold)
                }.frame(width: 157, height: 157)
            }
        }
    }
}

#Preview {
    PokeItemView()
}
