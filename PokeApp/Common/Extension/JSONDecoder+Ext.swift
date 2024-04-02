//
//  JSONDecoder+Ext.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

extension JSONDecoder {
    static func decoder(with strategy: KeyDecodingStrategy) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = strategy
        
        return decoder
    }
}
