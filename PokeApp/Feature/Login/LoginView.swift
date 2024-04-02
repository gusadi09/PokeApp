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
                    let vc = UIApplication.shared.rootViewController
                    viewModel.onTappedGoogleSignIn(from: vc)
                }
                .frame(width: 220)
                .accessibilityIdentifier("google_button")
                
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
