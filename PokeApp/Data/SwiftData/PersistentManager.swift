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
    
    func modelContainer<Model: PersistentModel>(from schema: [Model.Type]) -> ModelContainer {
        let schema = Schema(schema)
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
