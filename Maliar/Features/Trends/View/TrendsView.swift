//
//  TrendsView.swift
//  Maliar
//
//  Created by Nicholas on 28/07/21.
//

import SwiftUI

struct TrendsView: View {
    
    @State private var animalSelected: Double = Double.nan
    @State private var isAnimalSelected: Bool = false
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    
    @Environment(\.colorScheme)
    
    var colorScheme
    var viewModel = LocationChartViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Trends")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                Spacer()
                DateSelectorView(startDate: $startDate, endDate: $endDate)
            }
            
            Spacer()
            
            HStack(spacing: 24) {
                GroupBox() {
                    HStack {
                        Spacer()
                        VStack (alignment: .leading) {
                            Text("Animal Overview")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                            Text("Based on the total number of news")
                                .font(.body)
                                .foregroundColor(.secondary)
                            Spacer()
                            AnimalBarChartView( animalSelected: $animalSelected, isAnimalSelected: $isAnimalSelected)
                        }
                        Spacer()
                    }
                }
                .aspectRatio(CGSize(width: 1.2, height: 1), contentMode: .fit)
                .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                .cornerRadius(10)
                
                
                GroupBox() {
                    HStack {
                        Spacer()
                        VStack (alignment: .leading) {
                            Text("Location Overview")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                            Text("Based on the total number of news")
                                .font(.body)
                                .foregroundColor(.secondary)
                            Spacer()
                            LocationBarChartView(animalSelected: $animalSelected, isAnimalSelected: $isAnimalSelected, viewModel: LocationChartViewModel(), entries: viewModel.setLocationTrend(isAnimalSelected: isAnimalSelected, animalSelected: animalSelected))
                        }
                        Spacer()
                    }
                    
                }
                .aspectRatio(CGSize(width: 0.8, height: 1), contentMode: .fit)
                .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                .cornerRadius(10)
            }
            
        }
        .padding(.horizontal, 24.0)
        .padding(.vertical, 27.0)
        .toolbar {
            DownloadShareButtonView(textItem: .constant("Trends"))
        }
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView()
    }
}
