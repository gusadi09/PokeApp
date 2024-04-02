//
//  PokemonResponse.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

struct PokemonResponse: Codable, Equatable {
    let id: Int?
    let name: String?
    let height: Int?
    let weight: Int?
    let stats: [StatResponse]?
    let types: [PokemonTypeResponse]?
    
    func meterHeight() -> String {
        String(format: "%.1f", Double(height ?? 0) / 10.0)
    }
    
    func kgWeight() -> String {
        String(format: "%.1f", Double(weight ?? 0) / 10.0)
    }
    
    func attack() -> String {
        guard let value = (stats ?? [])
            .first(where: {
                ($0.stat?.name ?? "").lowercased() == "attack"
            })?
            .baseStat else { return "" }
        
        return String(value)
    }
    
    func healthProgress() -> String {
        guard let value = (stats ?? [])
            .first(where: {
                ($0.stat?.name ?? "").lowercased() == "hp"
            })?
            .baseStat else { return "" }
        
        return String(value)
    }
    
    func defense() -> String {
        guard let value = (stats ?? [])
            .first(where: {
                ($0.stat?.name ?? "").lowercased() == "defense"}
            )?
            .baseStat else { return "" }
        
        return String(value)
    }
    
    func speed() -> String {
        guard let value = (stats ?? [])
            .first(where: {
                ($0.stat?.name ?? "").lowercased() == "speed"
            })?
            .baseStat else { return "" }
        return String(value)
    }
    
    func allTypesString() -> String {
        (types ?? [])
            .sorted{
                ($0.slot ?? 0) < ($1.slot ?? 0)
            }
            .map{
                ($0.type?.name ?? "").capitalized
            }
            .joined(separator: ", ")
    }
    
    func imageUrl() -> URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id ?? 0).png") ?? (NSURL() as URL)
    }
}

struct StatResponse: Codable, Equatable {
    let baseStat: Int?
    let stat: NameWrapperResponse?
}

struct PokemonTypeResponse: Codable, Equatable {
    let slot: Int?
    let type: NameWrapperResponse?
}
