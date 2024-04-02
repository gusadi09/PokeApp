//
//  PokemonDefaultLocalDataSource.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation
import SwiftData

final class PokemonDefaultLocalDataSource: PokemonLocalDataSource {
    
    private let persistent: PersistentManager
    
    init(persistent: PersistentManager = PersistentManager.shared) {
        self.persistent = persistent
    }
    
    @MainActor
    func getDetailPokemon(from id: String) -> PokemonResponse? {
        do {
            let items = try persistent.modelContainer.mainContext.fetch(FetchDescriptor<Pokemon>())
            guard let pokemon = items.first(where: {
                $0.pokeId == Int(id)
            }) else { return nil }
            
            return PokemonResponse(from: pokemon)
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func saveDetail(_ pokemon: PokemonResponse) {
        
        persistent.modelContainer.mainContext.insert(Pokemon(from: pokemon))
        
        do {
            try persistent.modelContainer.mainContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func getSpecies(from id: String) -> SpeciesResponse? {
        
        do {
            let items = try persistent.modelContainer.mainContext.fetch(FetchDescriptor<Species>())
            guard let species = items.first(where: {
                $0.specId == Int(id)
            }) else { return nil }
            
            return SpeciesResponse(from: species)
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func saveSpecies(_ species: SpeciesResponse) {
        
        persistent.modelContainer.mainContext.insert(Species(from: species))
        
        do {
            try persistent.modelContainer.mainContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor
    func getEvolutions(from evoId: String) -> EvolutionLinkResponse? {
        
        do {
            let items = try persistent.modelContainer.mainContext.fetch(FetchDescriptor<EvolutionLink>())
            
            guard let evo = items.first(where: {
                $0.evoId == Int(evoId)
            }) else { return nil }
                    
            return EvolutionLinkResponse(from: evo)
            
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    @MainActor 
    func saveEvolutions(_ link: EvolutionLinkResponse) {
        persistent.modelContainer.mainContext.insert(EvolutionLink(from: link))
        
        do {
            try persistent.modelContainer.mainContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
