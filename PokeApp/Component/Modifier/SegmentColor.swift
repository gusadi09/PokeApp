//
//  SegmentColor.swift
//  PokeApp
//
//  Created by Gus Adi on 03/04/24.
//

import SwiftUI

struct SegmentColor: ViewModifier {
    let selected: Color
    let selectedText: Color
    let text: Color
    
    func body(content: Content) -> some View {
            content
            .onAppear(perform: {
                UISegmentedControl
                    .appearance()
                    .selectedSegmentTintColor = UIColor(selected)
                
                UISegmentedControl
                    .appearance()
                    .setTitleTextAttributes(
                        [.foregroundColor: UIColor(selectedText)],
                        for: .selected
                    )
                
                UISegmentedControl
                    .appearance()
                    .setTitleTextAttributes(
                        [.foregroundColor: UIColor(text)],
                        for: .normal
                    )
            })
        }
}

extension View {
    func segmentColor(selected: Color, selectedText: Color, text: Color) -> some View {
        modifier(SegmentColor(selected: selected, selectedText: selectedText, text: text))
    }
}
