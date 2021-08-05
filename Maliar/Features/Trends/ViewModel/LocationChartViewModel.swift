//
//  AnimalBarChartViewModel.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import SwiftUI
import Charts

class LocationChartViewModel: ObservableObject {
    @Published var locationList: [BarChartDataEntry] = LocationTrends.locationDataEntries(locationTrends: LocationTrends.allLocations)
    
    
    
    //berhubungan sama db
    
}
