//
//  PersistentManager.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation
import SwiftData

class PersistentManager {
    static let shared = PersistentManager()
    
    var modelContainer: ModelContainer = {
        let schema = Schema([
            Pokemon.self,
            Species.self,
            EvolutionLink.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
