//
//  CasesView.swift
//  Maliar
//
//  Created by Nicholas on 28/07/21.
//

import SwiftUI

struct CasesView: View {
    @StateObject var viewModel = CasesViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Cases")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                Spacer()
                DateSelectorView(startDate: $viewModel.filterStartDate, endDate: $viewModel.filterEndDate)
            }
            GroupBox {
                VStack(alignment: .leading) {
                    VStack {
                        Text("\(viewModel.fullData.count)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("Total Cases")
                    }
                    .padding()
                    
                    // Start of the Data Table
                    ScrollView(.vertical, showsIndicators: true) {
                        LazyVGrid(columns: viewModel.gridItem, alignment: .center, spacing: 0) {
                            // Header in the first place
                            TableHeaderView(TableHeader.number)
                            TableHeaderView(TableHeader.rowDate) /* { header in
                                viewModel.sortTable(header)
                            } */
                            TableHeaderView(TableHeader.newsTitle)
                            TableHeaderView(TableHeader.animalName)
                            TableHeaderView(TableHeader.numOfAnimal) /* { header in
                             viewModel.sortTable(header)
                         } */
                            TableHeaderView(TableHeader.province)
                            TableHeaderView(TableHeader.district)
                            TableHeaderView(TableHeader.caseTime) /* { header in
                             viewModel.sortTable(header)
                         } */
                            TableHeaderView(TableHeader.link)
                            
                            // Show the Data
                            ForEach(Array(viewModel.filtered.enumerated()), id: \.0) { index, data in
                                TableCellView(text: "\(index + 1)")
                                TableCellView(text: "\(data.getFormattedDate(date: data.date))")
                                TableCellView(text: "\(data.newsTitle)")
                                TableCellView(text: "\(data.animalName)")
                                TableCellView(text: "\(data.numberOfAnimal)")
                                TableCellView(text: "\(data.province)")
                                TableCellView(text: "\(data.district)")
                                TableCellView(text: "\(data.getFormattedDate(date: data.caseTime))")
                                TableCellView(url: data.link)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Cases")
        .padding()
        .toolbar {
            // The header toolbar content
            Button {
                print("Sort button pressed")
            } label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
            }
            .help("Sort Table")
            Button {
                print("Edit button pressed")
            } label: {
                Image(systemName: "square.and.pencil")
            }
            .help("Edit Data")
            DownloadShareButtonView(textItem: $viewModel.csvContent)
            TextField("Search", text: $viewModel.searchQuery)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(minWidth: 200)
                .onChange(of: viewModel.searchQuery) { value in
                    viewModel.searchOnTable(keyword: value)
                }
        }
        .onAppear {
            viewModel.searchOnTable(keyword: "")
        }
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
            .preferredColorScheme(.light)
        CasesView()
            .preferredColorScheme(.dark)
    }
}
