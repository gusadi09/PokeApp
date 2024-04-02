//
//  ContentView.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import GoogleSignInSwift
import SwiftUI
import SwiftData

struct LoginView: View {

    var body: some View {
        ZStack {
            Color.pokePrimary
                .ignoresSafeArea(edges: .all)
            
            VStack {
                Spacer()
                
                Image(.mainLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 253, height: 112)
                
                Spacer()
                
                GoogleSignInButton {
                    
                }
                .frame(width: 220)
                
                Spacer()
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
