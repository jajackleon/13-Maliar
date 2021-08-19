//
//  AnimalChartViewModel.swift
//  Maliar
//
//  Created by Daniella Stefani on 05/08/21.
//

import SwiftUI
import Charts

class AnimalChartViewModel: ObservableObject {
    @Published var animalList: [BarChartDataEntry] = AnimalTrends.animalDataEntries(animalTrends: AnimalTrends.allAnimals)
    
    //berhubungan sama db
    
    // Create the CSV Structure on String
    func generateCSV() -> String {
        return "asd,fgh,jkl\nqwer,tyu,iop"
    }
}
