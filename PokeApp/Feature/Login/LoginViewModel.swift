//
//  LoginViewModel.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var phase: Phase = .initial
    @Published var isAlreadyLogin = false
    @Published var isError = false
}
