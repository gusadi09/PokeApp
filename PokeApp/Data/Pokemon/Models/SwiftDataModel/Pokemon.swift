//
//  Item.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation
import SwiftData

@Model
final class Pokemon {
    var pokeId: Int
    var name: String
    var height: Int
    var weight: Int
    var stats: [Stat]
    var types: [PokemonType]
    
    init(
        pokeId: Int,
        name: String,
        height: Int,
        weight: Int,
        stats: [Stat],
        types: [PokemonType]
    ) {
        self.pokeId = pokeId
        self.name = name
        self.height = height
        self.weight = weight
        self.stats = stats
        self.types = types
    }
    
    var meterHeight: String {
        String(format: "%.1f", Double(height) / 10.0)
    }
    
    var kgWeight: String {
        String(format: "%.1f", Double(weight) / 10.0)
    }
    
    var attack: String {
        guard let value = stats.first(where: {$0.stat?.name.lowercased() == "attack"})?.baseStat else { return "??" }
        return String(value)
    }
    
    var hp: String {
        guard let value = stats.first(where: {$0.stat?.name.lowercased() == "hp"})?.baseStat else { return "??" }
        return String(value)
    }
    
    var defense: String {
        guard let value = stats.first(where: {$0.stat?.name.lowercased() == "defense"})?.baseStat else { return "??" }
        return String(value)
    }
    
    var speed: String {
        guard let value = stats.first(where: {$0.stat?.name.lowercased() == "speed"})?.baseStat else { return "??" }
        return String(value)
    }
    
    var allTypesString: String {
        types.map{$0.type?.name.capitalized ?? "??"}
            .sorted(by: <)
            .joined(separator: ", ")
    }
    
    var imageUrl: URL {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
    }
}

@Model
class Stat {
    var baseStat: Int
    var stat: NameWrapper?
    
    init(baseStat: Int, stat: NameWrapper? = nil) {
        self.baseStat = baseStat
        self.stat = stat
    }
}

@Model
class PokemonType {
    var slot: Int
    var type: NameWrapper?
    
    init(slot: Int, type: NameWrapper? = nil) {
        self.slot = slot
        self.type = type
    }
}
