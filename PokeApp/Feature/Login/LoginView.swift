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
    
    @StateObject var viewModel = LoginViewModel()
    @StateObject var navigation = NavigationRoutes.shared
    
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
        .alert("Attention", isPresented: $viewModel.isError) {
            Button("OK") { }
        } message: {
            Text(viewModel.phase.errorString)
        }
    }
}

#Preview {
    LoginView()
}
