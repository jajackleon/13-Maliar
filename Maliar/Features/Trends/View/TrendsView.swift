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
                    // TODO: Input action to retreive new data
                    viewModel.animalList.removeAll()
                    viewModel.loadData()
                }
            }
            
            GeometryReader { geo in
                HStack(spacing: 24) {
                    if viewModel.isLoading {
                        // Loading circle
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
                    } else {
                        
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
