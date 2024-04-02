//
//  NameWrapperResponse.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

struct ListResponse<T: Codable>: Codable {
    let results: [T]
}

struct NameWrapperResponse: Identifiable, Codable, Hashable {
    let name: String
    let url: URL
}

extension NameWrapperResponse {
    var id: String {
        return url.lastPathComponent
    }
    
    var imageUrl: URL {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
    }
}
