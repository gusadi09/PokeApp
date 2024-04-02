//
//  NavigationRoutes.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

final class NavigationRoutes: ObservableObject {
    static let shared = NavigationRoutes()
    
    let routes: [Route] = [.login, .home, .detail]
    
    @Published var path = [Route]()
}
