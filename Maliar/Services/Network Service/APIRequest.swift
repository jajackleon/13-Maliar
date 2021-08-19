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
        
        AF.request(Constants.GET_LEARNING_LIST_OLDEST, method: .get, headers: header).responseData { data in
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
                            province: fields["Province"][0].stringValue.getProvince(id: fields["Province"][0].stringValue),
                            newsTime: createdTimeDate,
                            caseTime: fields["CaseTime"].stringValue,
                            isRead: fields["IsRead"].stringValue
                        )
                        newsCases.append(newsCase)
                    }
                }
                completionHandler(newsCases)
            } catch {
                print("Error handling JSON: \(error)")
            }
        }
    }
    
    static func fetchNotification(isRead: Bool, completionHandler: @escaping([Notification]) -> Void){
        BaseRequest.GET_NOTIFICATION(isRead: isRead) { data in
            completionHandler(data)
        }
    }
    
    static func updateNewsCase(documentID: String, tableCell: TableCell, updatedData: String, completionHandler: @escaping() -> Void){
        let patchURL = Constants.GET_LEARNING_LIST + "/" + documentID
        
        let header:HTTPHeaders = [
            "Authorization": "Bearer keysCSuJoizCcFgHS",
            "Content-Type" : "application/json"]
        
        let params: Parameters = ["fields":[tableCell.rawValue: updatedData], "typecast":true]
        
        AF.request(patchURL, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { data in
            completionHandler()
        }
    }
    
    static func addNewsCase(animalName: String, numberOfAnimal: String, province: String, newsTitle: String, link: String, district: String, completionHandler: @escaping(Data) -> Void){
        
        let header = [
            "Authorization": "Bearer keysCSuJoizCcFgHS",
            "Content-Type" : "application/json"]
        
        let animalName = "Burung Rangkong"
        let numberOfAnimal = "23"
        let province = "reczczWUqMUP9iU16"
        let newsTitle = "Sebanyak 23 paruh Burung Rangkong ditemukan di Kota Singkawang, Kalimantan Barat"
        let link = "https://www.instagram.com/jajackleon/"
        let disctrict = "Singkawang"
        
        
        let caseTime = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "YY/MM/dd"
        dateFormatter.string(from: caseTime)
        
        let jsonstring = """
                            {"records":
                              [
                                {"fields":
                                  {
                                    "AnimalName":"\(animalName)",
                                    "NumberOfAnimal":"\(numberOfAnimal)",
                                    "Province":[
                                        "\(province)"
                                        ],
                                    "NewsTitle":"\(newsTitle)",
                                    "Link":"\(link)",
                                    "District":"\(disctrict)",
                                    "CaseTime":"\(dateFormatter)",
                                    "IsRead" : "0"
                                  }
                                }
                              ]
                             }
                            """
        let request = NSMutableURLRequest(url: NSURL(string: Constants.POST_LEARNING)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        let jsonSessionData = jsonstring.data(using: .utf8)!
        let jsonSession = try! JSONSerialization.jsonObject(with: jsonSessionData, options: .allowFragments)
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonSession)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = header
        request.httpBody = jsonData

        let session = URLSession.shared

        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                if let dataFromAPI = data {
                    completionHandler(dataFromAPI)
                }
            }
        })

        dataTask.resume()
    }
}

// MARK: - Trend Fetch
extension APIRequest {
    static func fetchTrend(completionHandler: @escaping([AnimalTrend]) -> Void){
        var newsCases : [AnimalProvince] = [AnimalProvince]()
        var allCases : [[AnimalProvince]] = [[AnimalProvince]]()
        var animalTrendDictionary = [[String : [AnimalProvince]]]()
        var animalTrend : [AnimalTrend] = [AnimalTrend]()
        
        
        let header:HTTPHeaders = [
            "Authorization": "Bearer keysCSuJoizCcFgHS" ]
        
        AF.request(Constants.GET_TRENDS, method: .get, headers: header).responseData { data in
            guard let stData = data.data else {return}
            do {
                let json = try JSON(data: stData)
                guard let records = json["records"].array
                else {return}
                
                for data in records {
                    let fields = data["fields"]
                    let animalProvince = AnimalProvince(
                        animalProvinceID: data["id"].stringValue,
                        provinceName: fields["ProvinceName"][0].stringValue,
                        animalsName: fields["AnimalName"][0].stringValue)
                    newsCases.append(animalProvince)
                }
                
                var animal = newsCases[0].animalsName
                
                var animalProvinceDump : [AnimalProvince] = [AnimalProvince]()
                
                for (idx, animalProvince) in newsCases.enumerated() {
                    
                    if animalProvince.animalsName == animal {
                        animalProvinceDump.append(animalProvince)
                    }
                    else {
                        animal = animalProvince.animalsName
                        allCases.append(animalProvinceDump)
                        animalProvinceDump.removeAll()
                        animalProvinceDump.append(animalProvince)
                    }
                    
                    if idx == newsCases.count - 1{
                        allCases.append(animalProvinceDump)
                        animalProvinceDump.removeAll()

                    }
                }
                
                for cases in allCases{
                    let dictionary = Dictionary(grouping: cases, by: { (element: AnimalProvince) in
                        return element.provinceName
                    })
                    animalTrendDictionary.append(dictionary)
                }
                
                
                for index in stride(from: 0, to: animalTrendDictionary.count, by: 1) {
                    var provinceCollection: [ProvinceTrend] = [ProvinceTrend]()
                    var count = 0
                    var animalName = ""
                    for data in animalTrendDictionary[index] {
                        let province = ProvinceTrend(totalProvince: "\(data.value.count)", provinceName: data.key)
                        count += data.value.count
                        animalName = data.value[0].animalsName
                        provinceCollection.append(province)
                    }
                
                    let animal = AnimalTrend(totalCase: "\(count)", animalName: animalName, provinceTrend: provinceCollection)
                    animalTrend.append(animal)
                    provinceCollection.removeAll()
                    count = 0
                }
                
                completionHandler(animalTrend)
            } catch {
                print("Error handling JSON: \(error)")
            }
        }
        
        
    }
}
