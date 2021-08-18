//
//  Sequence+.swift
//  Maliar
//
//  Created by Jackie Leonardy on 17/08/21.
//

import Foundation

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
