//
//  NewsCase.swift
//  Maliar
//
//  Created by Jackie Leonardy on 09/08/21.
//

import Foundation

struct NewsCase: Identifiable {
    var id: String = UUID().uuidString
    var caseID: String
    var animalName: String
    var district: String
    var link: String
    var newsTitle: String
    var numberOfAnimal: String
    var province: String
    var newsTime: Date
    var caseTime: String
        
    func getFormattedDate(date: Date) -> String {
        let df = DateFormatter()
        df.timeStyle = .none
        df.dateStyle = .short
        df.dateFormat = "yyyy/MM/dd"
        return df.string(from: date)
    }
}
