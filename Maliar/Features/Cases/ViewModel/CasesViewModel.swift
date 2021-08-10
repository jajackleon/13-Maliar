//
//  CasesViewModel.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import SwiftUI

class CasesViewModel: ObservableObject {
    // Table Filter
    @Published var filterStartDate = Date()
    @Published var filterEndDate = Date()
    @Published var searchQuery = ""
    @Published var csvContent = ""
    @Published var isTableEditing = false
    
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
        NewsCase(caseID: "", animalName: "", district: "", link: "", newsTitle: "", numberOfAnimal: "", province: "", caseTime: ""),
        NewsCase(caseID: "", animalName: "", district: "", link: "", newsTitle: "", numberOfAnimal: "", province: "", caseTime: ""),
        NewsCase(caseID: "", animalName: "", district: "", link: "", newsTitle: "", numberOfAnimal: "", province: "", caseTime: ""),
        NewsCase(caseID: "", animalName: "", district: "", link: "", newsTitle: "", numberOfAnimal: "", province: "", caseTime: ""),
        NewsCase(caseID: "", animalName: "", district: "", link: "", newsTitle: "", numberOfAnimal: "", province: "", caseTime: "")
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
        filtered.sort { lNews, rNews in
            switch tableHeader {
            case .rowDate:
                if lNews.newsTime < rNews.newsTime {
                    return lNews.newsTime > rNews.newsTime
                } else {
                    return lNews.newsTime < rNews.newsTime
                }
            case .caseTime:
                if lNews.caseTime < rNews.caseTime {
                    return lNews.caseTime > rNews.caseTime
                } else {
                    return lNews.caseTime < rNews.caseTime
                }
            case .numOfAnimal:
                if lNews.numberOfAnimal < rNews.numberOfAnimal {
                    return lNews.numberOfAnimal > rNews.numberOfAnimal
                } else {
                    return lNews.numberOfAnimal < rNews.numberOfAnimal
                }
            default:
                return lNews.newsTime > rNews.newsTime
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
    
    func editTable() {
        APIRequest.fetchNewsCase { (result) in
            self.filtered = result
        }
//        self.filtered = APIRequest.fetchNewsCase()
        isTableEditing.toggle()
    }
    
    func fetchData(){
        
    }
}
