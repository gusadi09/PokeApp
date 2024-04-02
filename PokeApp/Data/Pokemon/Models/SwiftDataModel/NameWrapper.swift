//
//  NameWrapper.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation
import SwiftData

@Model
class NameWrapper: Identifiable {
    var name: String
    var url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

extension NameWrapper {
    var id: String {
        let url = URL(string: self.url)!
        return url.lastPathComponent
    }
    
    var imageUrl: URL {
        return URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
    }
}
