//
//  PokemonMapper.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

extension NameWrapper {
    convenience init(from response: NameWrapperResponse) {
        self.init(name: response.name ?? "", url: response.url?.absoluteString ?? "")
    }
}

extension Pokemon {
    convenience init(from response: PokemonResponse) {
        let stats = (response.stats ?? []).compactMap {
            return Stat(from: $0)
        }
        let type = (response.types ?? []).compactMap {
            return PokemonType(from: $0)
        }
        
        self.init(
            pokeId: response.id ?? 0,
            name: response.name ?? "",
            height: response.height ?? 0,
            weight: response.weight ?? 0,
            stats: stats,
            types: type
        )
    }
}

extension Stat {
    convenience init(from response: StatResponse) {
        self.init(
            baseStat: response.baseStat ?? 0,
            stat: NameWrapper(from: response.stat ?? NameWrapperResponse(name: "", url: nil))
        )
    }
}

extension PokemonType {
    convenience init(from response: PokemonTypeResponse) {
        self.init(
            slot: response.slot ?? 0,
            type: NameWrapper(from: response.type ?? NameWrapperResponse(name: "", url: nil))
        )
    }
}

extension Species {
    convenience init(from response: SpeciesResponse) {
        self.init(
            specId: response.id ?? 0,
            evolutionChain: SpeciesEvolutionChain(from: response.evolutionChain ?? SpeciesResponse.EvolutionChainResponse(url: URL(string: "") ?? (NSURL() as URL)))
        )
    }
}

extension SpeciesEvolutionChain {
    convenience init(from response: SpeciesResponse.EvolutionChainResponse) {
        self.init(url: response.url.absoluteString)
    }
}

extension EvolutionLink {
    convenience init(from response: EvolutionLinkResponse) {
        self.init(evoId: response.id ?? 0, chain: ChainLink(from: response.chain ?? ChainLinkResponse(species: nil, evolvesTo: nil)))
    }
}

extension ChainLink {
    convenience init(from response: ChainLinkResponse) {
        let evolves = (response.evolvesTo ?? []).compactMap {
            ChainLink(from: $0)
        }
        self.init(species: NameWrapper(from: response.species ?? NameWrapperResponse(name: "", url: nil)), evolvesTo: evolves)
    }
}

extension NameWrapperResponse {
    init(from object: NameWrapper) {
        self.init(name: object.name, url: URL(string: object.url) ?? (NSURL() as URL))
    }
}

extension PokemonResponse {
    init(from object: Pokemon) {
        self.init(
            id: object.pokeId,
            name: object.name,
            height: object.height,
            weight: object.weight,
            stats: object.stats.map{StatResponse(from: $0)},
            types: object.types.map{PokemonTypeResponse(from: $0)}
        )
    }
}

extension StatResponse {
    init(from object: Stat) {
        self.init(
            baseStat: object.baseStat,
            stat: NameWrapperResponse(from: object.stat ?? NameWrapper(name: "", url: ""))
        )
    }
}

extension PokemonTypeResponse {
    init(from object: PokemonType) {
        self.init(
            slot: object.slot,
            type: NameWrapperResponse(from: object.type ?? NameWrapper(name: "", url: ""))
        )
    }
}

extension SpeciesResponse {
    init(from object: Species) {
        self.init(
            id: object.specId,
            evolutionChain: SpeciesResponse.EvolutionChainResponse(
                url: URL(string: object.evolutionChain?.url ?? "") ?? (NSURL() as URL)
            )
        )
    }
}

extension EvolutionLinkResponse {
    init(from object: EvolutionLink) {
        self.id = object.evoId
        self.chain = ChainLinkResponse(from: object.chain ?? ChainLink(evolvesTo: []))
    }
}

extension ChainLinkResponse {
    init(from object: ChainLink) {
        self.species = NameWrapperResponse(from: object.species ?? NameWrapper(name: "", url: ""))
        self.evolvesTo = object.evolvesTo.map { ChainLinkResponse(from: $0) }
    }
}
