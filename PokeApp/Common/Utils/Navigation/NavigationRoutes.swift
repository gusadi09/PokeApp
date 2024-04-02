//
//  NavigationRoutes.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

final class NavigationRoutes: ObservableObject {
    static let shared = NavigationRoutes()
    
    @Published var path = [String]()
}
