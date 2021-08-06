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
    var id = UUID()
    var date: Date
    var newsTitle: String
    var animalName: String
    var numberOfAnimal: Int
    var province: String
    var district: String
    var caseTime: Date
    var link: URL
    
    func getFormattedDate(date: Date) -> String {
        let df = DateFormatter()
        df.timeStyle = .none
        df.dateStyle = .short
        df.dateFormat = "yyyy/MM/dd"
        return df.string(from: date)
    }
}
