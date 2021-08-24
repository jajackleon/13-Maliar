//
//  TrendsView.swift
//  Maliar
//
//  Created by Nicholas on 28/07/21.
//

import SwiftUI

struct TrendsView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = TrendsViewModel()
    
    var body: some View {
        VStack {
            HStack(spacing: 24) {
                Text("Trends")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                Spacer()
                RetrieveDataButton {
                    viewModel.animalList.removeAll()
                    viewModel.loadData()
                }
            }
            // TODO: Refactoring
            GeometryReader { geo in
                HStack(spacing: 24) {
                    if viewModel.isProvinceLoading && viewModel.isProvinceLoading {
                        // Loading circle
                        GroupBox() {
                            VStack(alignment: .trailing){
                                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .accentColor)).scaleEffect(2)
                            }
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                        .frame(width: geo.size.width * 0.60)
                        
                        
                        GroupBox() {
                            VStack(alignment: .trailing){
                                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .accentColor)).scaleEffect(2)
                            }
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                    }
                    else if viewModel.isProvinceLoading && !viewModel.isAnimalLoading {
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
                                    AnimalBarChartView(viewModel: viewModel)
                                }
                                Spacer()
                            }
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                        .frame(width: geo.size.width * 0.60)
                        
                        
                        GroupBox() {
                            VStack(alignment: .trailing){
                                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .accentColor)).scaleEffect(2)
                            }
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                    }
                    
                    else if !viewModel.isProvinceLoading && viewModel.isAnimalLoading {
                        GroupBox() {
                            VStack(alignment: .trailing){
                                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .accentColor)).scaleEffect(2)
                            }
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .center
                            )
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                        .frame(width: geo.size.width * 0.60)
                        
                        
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
                                    LocationBarChartView(viewModel: viewModel)
                                }
                                Spacer()
                            }
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                    }
                    
                    else {
                        
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
                                    AnimalBarChartView(viewModel: viewModel)
                                }
                                Spacer()
                            }
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                        .frame(width: geo.size.width * 0.60)
                        
                        
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
                                    LocationBarChartView(viewModel: viewModel)
                                }
                                Spacer()
                            }
                            
                        }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .cornerRadius(10)
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
        .navigationTitle("Trends")
        .padding(.horizontal, 24.0)
        .padding(.vertical, 27.0)
        .toolbar {
            DownloadShareButtonView(textItem: $viewModel.csvString)
        }
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView(viewModel: TrendsViewModel())
    }
}
