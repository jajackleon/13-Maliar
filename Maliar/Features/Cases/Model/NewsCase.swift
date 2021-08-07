//
//  Case.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import Foundation

/*
 No. Date. News Title. Animal Name. Number of Animal. Province. District. Case Time. Link
*/

struct NewsCase: Identifiable {
    var id: String = UUID().uuidString
    var date: Date = Date()
    var animalName: String
    var district: String
    var link: String
    var newsTitle: String
    var numberOfAnimal: String
    var province: String
    var newsTime: String
    var caseTime: String
    
    func getFormattedDate(date: Date) -> String {
        let df = DateFormatter()
        df.timeStyle = .none
        df.dateStyle = .short
        df.dateFormat = "yyyy/MM/dd"
        return df.string(from: date)
    }
}
