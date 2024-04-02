//
//  ContainerView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import SwiftUI

struct ContainerView<Content: View, Style: ShapeStyle>: View {
    let content: Content
    let style: Style
    let bgColor: Color
    
    init(style: Style, bgColor: Color, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.style = style
        self.bgColor = bgColor
    }
    
    var body: some View {
        content
            .foregroundStyle(style)
            .background(RoundedRectangle(cornerRadius: 10).fill(bgColor))
    }
}

#Preview {
    ContainerView(
        style: .pokeLight,
        bgColor: .pokePrimary
    ) {
        
    }
}
