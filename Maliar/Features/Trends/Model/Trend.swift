//
//  Trend.swift
//  Maliar
//
//  Created by Jackie Leonardy on 19/08/21.
//

import Foundation

struct Trend: Identifiable {
    var id: String = UUID().uuidString
    typealias DictionaryType = [[String : [AnimalProvince]]]
    private var products = DictionaryType()
    
    init(products: DictionaryType) {
            self.products = products
    }
}

struct AnimalProvince: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var animalProvinceID: String
    var provinceName: String
    var animalsName: String
}

struct AnimalTrend: Identifiable {
    var id: String = UUID().uuidString
    var totalCase: String
    var animalName: String
    var provinceTrend: [ProvinceTrend]
}

struct ProvinceTrend: Identifiable {
    var id: String = UUID().uuidString
    var totalProvince: String
    var provinceName: String
}
