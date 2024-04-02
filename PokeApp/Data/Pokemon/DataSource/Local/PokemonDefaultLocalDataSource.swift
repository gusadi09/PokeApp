//
//  PokemonDefaultLocalDataSource.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation
import SwiftData

final class PokemonDefaultLocalDataSource: PokemonLocalDataSource {
    
    let persistent: PersistentManager
    
    init(persistent: PersistentManager = PersistentManager.shared) {
        self.persistent = persistent
    }
    
    @MainActor
    func getDetailPokemon(from id: String) -> PokemonResponse? {
        let modelContext = persistent.modelContainer(from: [Pokemon.self]).mainContext
        
        do {
            let items = try modelContext.fetch(FetchDescriptor<Pokemon>())
            return PokemonResponse(from: items.first {
                $0.pokeId == Int(id)
            } ?? Pokemon(pokeId: 0, name: "", height: 0, weight: 0, stats: [], types: []))
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func saveDetail(_ pokemon: PokemonResponse) {
        let modelContext = persistent.modelContainer(from: [Pokemon.self]).mainContext
        
        modelContext.insert(Pokemon(from: pokemon))
        
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func getSpecies(from id: String) -> SpeciesResponse? {
        let modelContext = persistent.modelContainer(from: [Species.self]).mainContext
        
        do {
            let items = try modelContext.fetch(FetchDescriptor<Species>())
            return SpeciesResponse(from: items.first {
                $0.specId == Int(id)
            } ?? Species(specId: 0))
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func saveSpecies(_ species: SpeciesResponse) {
        let modelContext = persistent.modelContainer(from: [Species.self]).mainContext
        
        modelContext.insert(Species(from: species))
        
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func getEvolutions(from evoId: String) -> EvolutionLinkResponse? {
        let modelContext = persistent.modelContainer(from: [EvolutionLink.self]).mainContext
        
        do {
            let items = try modelContext.fetch(FetchDescriptor<EvolutionLink>())
            return EvolutionLinkResponse(from: items.first {
                $0.evoId == Int(evoId)
            } ?? EvolutionLink(evoId: 0, chain: nil))
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor 
    func saveEvolutions(_ link: EvolutionLinkResponse) {
        let modelContext = persistent.modelContainer(from: [EvolutionLink.self]).mainContext
        
        modelContext.insert(EvolutionLink(from: link))
        
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
