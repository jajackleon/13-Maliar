//
//  Collection+Extensions.swift
//  Maliar
//
//  Created by Nicholas on 13/08/21.
//

import Foundation

extension Collection {
    func count(where test: (Element) throws -> Bool) rethrows -> Int {
        return try self.filter(test).count
    }
}
