//
//  Location.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import Charts
import Foundation

struct LocationTrends {
    var locationCode: Double
    var quantity: Double
    
    static func locationDataEntries(locationTrends: [LocationTrends]) -> [BarChartDataEntry] {
        
        return locationTrends.map{BarChartDataEntry(x: $0.locationCode, y: $0.quantity )}
    }
    
    static var locations = ["Medan", "Sumatera", "Aceh", "Jawa","Papua", "Maluku", "Afrika", "Indonesia", "Australia", "Amerika"]
    
    static var allLocations: [LocationTrends] {
        [
            LocationTrends(locationCode: 0, quantity: 30),
            LocationTrends(locationCode: 1, quantity: 25),
            LocationTrends(locationCode: 2, quantity: 15),
            LocationTrends(locationCode: 3, quantity: 8),
            LocationTrends(locationCode: 4, quantity: 4),
            LocationTrends(locationCode: 5, quantity: 30),
            LocationTrends(locationCode: 6, quantity: 25),
            LocationTrends(locationCode: 7, quantity: 15),
            LocationTrends(locationCode: 8, quantity: 8),
            LocationTrends(locationCode: 9, quantity: 4)
        ]
    }
}
