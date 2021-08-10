//
//  APIRequest.swift
//  Maliar
//
//  Created by Jackie Leonardy on 10/08/21.
//

import Foundation
import Alamofire

class APIRequest: NSObject{
    
    static func fetchNewsCase(completionHandler: @escaping([NewsCase]) -> Void){
        var newsCases : [NewsCase] = [NewsCase]()
        
        let header:HTTPHeaders = [
            "Authorization": "Bearer keysCSuJoizCcFgHS" ]

        
        AF.request(Constants.GET_LEARNING_LIST, method: .get, headers: header).responseDecodable(of: NewsCaseData.self) { (response) in

            print(response)
            
            guard let newsData = response.value else { return }
            newsData.records?.forEach{ record in
                let fields = record.fields
                let cases = NewsCase(caseID: record.caseID!, animalName: fields!.AnimalName, district: fields!.District, link: fields!.Link, newsTitle: fields!.NewsTitle, numberOfAnimal: fields!.NumberOfAnimal, province: fields!.Province[0], caseTime: fields!.CaseTime)
                newsCases.append(cases)
                print(cases)
                
            }
            completionHandler(newsCases)

          }
    }
}
