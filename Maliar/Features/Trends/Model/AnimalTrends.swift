//
//  Trends.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import Charts
import Foundation

struct AnimalTrends {
    var animalCode: Double
    var totalQuantity: Double
    var location: [LocationTrends]
    
    static func animalDataEntries(animalTrends: [AnimalTrends]) -> [BarChartDataEntry] {
        
        return animalTrends.map{BarChartDataEntry(x: $0.animalCode, y: $0.totalQuantity)}
    }
    
    static func animalLocationDataEntries(_ animalCode: Double, animalTrendsSelectedFrom: [AnimalTrends]) -> [BarChartDataEntry] {
        var animalSelected: [AnimalTrends] = []
        animalSelected = animalTrendsSelectedFrom.filter { $0.animalCode == animalCode}
        let locationSelected = animalSelected[0].location
        return locationSelected.map{ BarChartDataEntry(x: $0.locationCode, y: $0.quantity)}
    }
    
    static var animals = ["Kukang", "Rangkong", "Harimau Sumatera", "Burung Nuri", "Kucing Alaska", "Apalah", "Badak Sumatera", "Burung Idup", "Kucing Kucingan", "gatau"]
    
    static var allAnimals: [AnimalTrends] {
        [
            AnimalTrends(animalCode: 0, totalQuantity: 32, location:
                            [
                                LocationTrends(locationCode: 0, quantity: 12),
                                LocationTrends(locationCode: 1, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 3, quantity: 6),
                                LocationTrends(locationCode: 4, quantity: 2),
                                LocationTrends(locationCode: 5, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 7, quantity: 3),
                                LocationTrends(locationCode: 8, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 1, totalQuantity: 20, location:
                            [
                                LocationTrends(locationCode: 3, quantity: 12),
                                LocationTrends(locationCode: 5, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 1, quantity: 6),
                                LocationTrends(locationCode: 4, quantity: 2),
                                LocationTrends(locationCode: 7, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 3),
                                LocationTrends(locationCode: 8, quantity: 7),
                                LocationTrends(locationCode: 0, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 2, totalQuantity: 15, location:
                            [
                                LocationTrends(locationCode: 8, quantity: 12),
                                LocationTrends(locationCode: 4, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 9, quantity: 6),
                                LocationTrends(locationCode: 5, quantity: 2),
                                LocationTrends(locationCode: 7, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 1, quantity: 3),
                                LocationTrends(locationCode: 3, quantity: 7),
                                LocationTrends(locationCode: 0, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 3, totalQuantity: 17, location:
                            [
                                LocationTrends(locationCode: 1, quantity: 12),
                                LocationTrends(locationCode: 4, quantity: 3),
                                LocationTrends(locationCode: 6, quantity: 4),
                                LocationTrends(locationCode: 0, quantity: 6),
                                LocationTrends(locationCode: 7, quantity: 2),
                                LocationTrends(locationCode: 5, quantity: 6),
                                LocationTrends(locationCode: 2, quantity: 7),
                                LocationTrends(locationCode: 8, quantity: 3),
                                LocationTrends(locationCode: 3, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 4, totalQuantity: 12, location:
                            [
                                LocationTrends(locationCode: 3, quantity: 12),
                                LocationTrends(locationCode: 5, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 1, quantity: 6),
                                LocationTrends(locationCode: 4, quantity: 2),
                                LocationTrends(locationCode: 7, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 3),
                                LocationTrends(locationCode: 8, quantity: 7),
                                LocationTrends(locationCode: 0, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 5, totalQuantity: 8, location:
                            [
                                LocationTrends(locationCode: 0, quantity: 12),
                                LocationTrends(locationCode: 1, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 3, quantity: 6),
                                LocationTrends(locationCode: 4, quantity: 2),
                                LocationTrends(locationCode: 5, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 7, quantity: 3),
                                LocationTrends(locationCode: 8, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 6, totalQuantity: 4, location:
                            [
                                LocationTrends(locationCode: 1, quantity: 12),
                                LocationTrends(locationCode: 4, quantity: 3),
                                LocationTrends(locationCode: 6, quantity: 4),
                                LocationTrends(locationCode: 0, quantity: 6),
                                LocationTrends(locationCode: 7, quantity: 2),
                                LocationTrends(locationCode: 5, quantity: 6),
                                LocationTrends(locationCode: 2, quantity: 7),
                                LocationTrends(locationCode: 8, quantity: 3),
                                LocationTrends(locationCode: 3, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 7, totalQuantity: 3, location:
                            [
                                LocationTrends(locationCode: 8, quantity: 12),
                                LocationTrends(locationCode: 4, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 9, quantity: 6),
                                LocationTrends(locationCode: 5, quantity: 2),
                                LocationTrends(locationCode: 7, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 1, quantity: 3),
                                LocationTrends(locationCode: 3, quantity: 7),
                                LocationTrends(locationCode: 0, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 8, totalQuantity: 2, location:
                            [
                                LocationTrends(locationCode: 0, quantity: 12),
                                LocationTrends(locationCode: 1, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 3, quantity: 6),
                                LocationTrends(locationCode: 4, quantity: 2),
                                LocationTrends(locationCode: 5, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 7, quantity: 3),
                                LocationTrends(locationCode: 8, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 2),
                            ]
            ),
            AnimalTrends(animalCode: 9, totalQuantity: 1, location:
                            [
                                LocationTrends(locationCode: 3, quantity: 12),
                                LocationTrends(locationCode: 5, quantity: 3),
                                LocationTrends(locationCode: 2, quantity: 4),
                                LocationTrends(locationCode: 1, quantity: 6),
                                LocationTrends(locationCode: 4, quantity: 2),
                                LocationTrends(locationCode: 7, quantity: 6),
                                LocationTrends(locationCode: 6, quantity: 7),
                                LocationTrends(locationCode: 9, quantity: 3),
                                LocationTrends(locationCode: 8, quantity: 7),
                                LocationTrends(locationCode: 0, quantity: 2),
                            ]
            )
        ]
    }
}
