//
//  TableHeader.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import Foundation

/*
 No. Date. News Title. Animal Name. Number of Animal. Province. District. Case Time. Link
*/

enum TableHeader: String, CaseIterable {
    case number = "No"
    case rowDate = "Date"
    case newsTitle = "Title"
    case animalName = "AnimalName"
    case numOfAnimal = "Number of Animal"
    case province = "Province"
    case district = "District"
    case caseTime = "Case Time"
    case link = "Link"
    
    func getSortable() -> Bool {
        switch self {
        case .rowDate: break
        case .newsTitle:
            return true
        default:
            return false
        }
        return false
    }
}
