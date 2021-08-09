//
//  CasesView.swift
//  Maliar
//
//  Created by Nicholas on 28/07/21.
//

import SwiftUI

struct CasesView: View {
    @StateObject var viewModel = CasesViewModel()
    @Environment(\.colorScheme) var colorScheme
    
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
                                TableCellView(text: .constant(data.getFormattedDate(date: data.date)), isEditing: $viewModel.isTableEditing)
                                TableCellView(text: $viewModel.filtered[index].newsTitle, isEditing: $viewModel.isTableEditing)
                                TableCellView(text: $viewModel.filtered[index].animalName, isEditing: $viewModel.isTableEditing)
                                TableCellView(text: $viewModel.filtered[index].numberOfAnimal, isEditing: $viewModel.isTableEditing)
                                TableCellView(text: $viewModel.filtered[index].province, isEditing: $viewModel.isTableEditing)
                                TableCellView(text: $viewModel.filtered[index].district, isEditing: $viewModel.isTableEditing)
                                TableCellView(text: .constant(data.getFormattedDate(date: data.date)), isEditing: $viewModel.isTableEditing)
                                TableCellView(text: $viewModel.filtered[index].link, isEditing: $viewModel.isTableEditing)
                            }
                        }
                    }
                }
            }
            .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .cornerRadius(10)
        }
        .navigationTitle("Cases")
        .padding(.horizontal, 24.0)
        .padding(.vertical, 27.0)
        .toolbar {
            // The header toolbar content
            Menu {
                Button("None") {
                    // "Action when none clicked"
                    viewModel.searchOnTable(keyword: "")
                }
                Divider()
                Button("Date Added") {
                    viewModel.sortTable(.rowDate)
                }
                Button("Case Time") {
                    viewModel.sortTable(.caseTime)
                }
                Button("Number of Animal") {
                    viewModel.sortTable(.numOfAnimal)
                }
            } label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
            }
            .help("Sort Table")
            
            // Edit button
            Button {
                print("Edit button pressed")
//                viewModel.getData()
//                AntaraScraper.shared.fetchDoc()
                GoogleCrawler.shared.crawl()
//                print(KompasScraper.shared.getNewsTime(url: ""))
                viewModel.editTable()
            } label: {
                Image(systemName: "square.and.pencil")
            }
            .help("Edit Data")
            
            // Download and Share Button
            DownloadShareButtonView(textItem: $viewModel.csvContent)
            
            // Search bar
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
