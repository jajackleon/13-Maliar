//
//  AnimalBarChartViewModel.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import SwiftUI
import Charts

class LocationChartViewModel: ObservableObject {
//    @Published var startDate: Date = Date()
//    @Published var endDate: Date = Date()
    @Published var locationList: [BarChartDataEntry] = LocationTrends.locationDataEntries(locationTrends: LocationTrends.allLocations)
    
    func setLocationTrend(isAnimalSelected: Bool, animalSelected: Double) -> [BarChartDataEntry] {
        if isAnimalSelected == false {
            locationList = LocationTrends.locationDataEntries(locationTrends: LocationTrends.allLocations)
            return locationList
        } else {
            locationList = AnimalTrends.animalLocationDataEntries(animalSelected, animalTrendsSelectedFrom: AnimalTrends.allAnimals)
            return locationList
        }
    }
    //berhubungan sama db
    
}
