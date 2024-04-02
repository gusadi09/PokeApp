//
//  LoginViewModel.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Firebase
import Foundation
import GoogleSignIn
import UIKit

final class LoginViewModel: ObservableObject {
    @Published var phase: Phase = .initial
    @Published var isAlreadyLogin = false
    @Published var isError = false
    
    let navigation = NavigationRoutes.shared
    
    func onTappedGoogleSignIn(from viewController: UIViewController) {
        guard let clientId = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientId)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { [weak self] user, error in
            if let error = error {
                self?.phase = .error(error.localizedDescription)
                return
            }
            
            guard let user = user?.user, let idToken = user.idToken else { return }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    self?.phase = .error(error.localizedDescription)
                    return
                }
                
                guard result?.user != nil else {
                    self?.phase = .error("Can't find your account")
                    return
                }
                self?.navigation.path.append(.home)
                self?.isAlreadyLogin = true
            }
        }
    }
}
