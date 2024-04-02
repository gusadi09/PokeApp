//
//  Array+Ext.swift
//  PokeApp
//
//  Created by Gus Adi on 02/04/24.
//

import Foundation

extension Array where Element: Hashable {
    mutating func appendWithoutDuplicate(_ array: [Element]) {
        var seen = Set<Element>()
        self = (self + array).filter { seen.insert($0).inserted }
    }
}
