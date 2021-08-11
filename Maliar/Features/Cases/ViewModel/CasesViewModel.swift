//
//  CasesViewModel.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import SwiftUI

class CasesViewModel: ObservableObject {
    // Table Filter
    @Published var filterStartDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    @Published var filterEndDate = Date()
    @Published var searchQuery = ""
    @Published var csvContent = ""
    @Published var isTableEditing = false
    var reverseSort = true
    
    var gridItem: [GridItem] = [
        GridItem(.fixed(40), spacing: 0),
        GridItem( spacing: 0),
        GridItem( spacing: 0),
        GridItem( spacing: 0),
        GridItem( spacing: 0),
        GridItem( spacing: 0),
        GridItem( spacing: 0),
        GridItem( spacing: 0),
        GridItem( spacing: 0),
    ]
    
    // Full data ini nanti bisa ngambil dari 
    var fullData: [NewsCase] = [
    ]
    
    @Published var filtered = [NewsCase]()
    
    // MARK: - Generate CSV String
    func generateCSVContent() {
        var csvHead = "No,Date,News Title,Animal Name,Number of Animal,Province,District,Case Time,News Link\n"
        for (index, data) in fullData.enumerated() {
            csvHead.append("\(index+1),\(data.newsTime),\(data.newsTitle),\(data.animalName),\(data.numberOfAnimal),\(data.province),\(data.district),\(data.caseTime),\(data.link)\n")
        }
        self.csvContent = csvHead
    }
    
    // MARK: - Sort the table based on ...
    func sortTable(_ tableHeader: TableHeader) {
        reverseSort.toggle()
        filtered.sort { lNews, rNews in
            switch tableHeader {
            case .rowDate:
                return reverseSort ? (lNews.newsTime > rNews.newsTime) : (lNews.newsTime < rNews.newsTime)
            case .caseTime:
                return reverseSort ? (lNews.caseTime > rNews.caseTime) : (lNews.caseTime < rNews.caseTime)
            case .numOfAnimal:
                return reverseSort ? (lNews.numberOfAnimal < rNews.numberOfAnimal) : (lNews.numberOfAnimal < rNews.numberOfAnimal)
            default:
                return reverseSort ? (lNews.newsTime > rNews.newsTime) : (lNews.newsTime < rNews.newsTime)
            }
        }
    }
    
    // MARK: - Search Table based on Keyword
    func searchOnTable(keyword: String) {
        if keyword.isEmpty {
            self.filtered = fullData
        } else {
            self.filtered = fullData.filter { newsCase in
                return newsCase.newsTitle.contains(keyword) || newsCase.animalName.contains(keyword) || newsCase.district.contains(keyword) || newsCase.province.contains(keyword)
            }
        }
        generateCSVContent()
    }
    
    // MARK: - Filter by date
    func dateFilter() {
//        let dateRange = filterStartDate...filterEndDate
        self.filtered = fullData.filter { filtering in
            return filtering.newsTime >= filterStartDate && filtering.newsTime <= filterEndDate
        }
    }
    
    // MARK: - Edit Table
    func editTable() {
        isTableEditing.toggle()
        // TODO: Insert the code to push everything to Airtable API
        GoogleCrawler.shared.crawl()
        APIRequest.addNewsCase { (data) in
            print(data)
        }
    }
}
