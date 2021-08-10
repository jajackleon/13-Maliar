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

struct NewsCaseData: Codable {
    let records: [NewsCaseDataResponse]?
}

struct NewsCaseDataResponse: Codable {
    let caseID: String?
    let fields: NewsCaseDataFieldResponse?
    let createdTime: String?
    
    enum CodingKeys: String, CodingKey{
        case caseID = "id"
        case fields
        case createdTime
    }
}

struct NewsCaseDataFieldResponse: Codable {
    let number: Int
    let AnimalName: String
    let NewsTitle: String
    let NumberOfAnimal: String
    let District: String
    let CaseTime: String
    let Link: String
    let Province: [String]
    
//    enum CodingKeys: String, CodingKey{
//        case caseID = "id"
//        case number
//        case AnimalName
//        case NewsTitle
//        case NumberOfAnimal
//        case District
//        case CaseTime
//        case Link
//        case Province
//    }
}

