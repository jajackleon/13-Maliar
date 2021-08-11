//
//  APIRequest.swift
//  Maliar
//
//  Created by Jackie Leonardy on 10/08/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIRequest: NSObject{
    
    static func fetchNewsCase(completionHandler: @escaping([NewsCase]) -> Void){
        var newsCases : [NewsCase] = [NewsCase]()
        
        let header:HTTPHeaders = [
            "Authorization": "Bearer keysCSuJoizCcFgHS" ]

        
        AF.request(Constants.GET_LEARNING_LIST, method: .get, headers: header).responseData { data in
            guard let stData = data.data else {return}
            do {
                let json = try JSON(data: stData)
                guard let records = json["records"].array
                else {return}
                
                let df = DateFormatter()
                df.locale = Locale(identifier: "en_US_POSIX")
                df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
                df.timeZone = TimeZone(secondsFromGMT: 0)
                
                for data in records {
                    let fields = data["fields"]
                    if let createdTimeDate = df.date(from: data["createdTime"].stringValue) {
                        let newsCase = NewsCase(
                            caseID: data["id"].stringValue,
                            animalName: fields["AnimalName"].stringValue,
                            district: fields["District"].stringValue,
                            link: fields["Link"].stringValue,
                            newsTitle: fields["NewsTitle"].stringValue,
                            numberOfAnimal: fields["NumberOfAnimal"].stringValue,
                            province: fields["Province"][0].stringValue,
                            newsTime: createdTimeDate,
                            caseTime: fields["CaseTime"].stringValue
                        )
                        newsCases.append(newsCase)
                    }
                }
                completionHandler(newsCases)
            } catch {
                print("Error handling JSON: \(error)")
            }
            
        }
            
//            .responseDecodable(of: NewsCaseData.self) { (response) in
//            let respJ
//            guard let newsData = response.value else { return }
//            newsData.records?.forEach{ record in
//                let df = DateFormatter()
//                guard let fields = record.fields,
//                      let createdTime = df.date(from: record.createdTime!)
//                else { return }
//
//                let cases = NewsCase(caseID: record.caseID!, animalName: fields.AnimalName, district: fields.District, link: fields.Link, newsTitle: fields.NewsTitle, numberOfAnimal: fields.NumberOfAnimal, province: fields.Province[0], newsTime: createdTime, caseTime: fields.CaseTime)
//                newsCases.append(cases)
//
//            }
//          }
    }
}
