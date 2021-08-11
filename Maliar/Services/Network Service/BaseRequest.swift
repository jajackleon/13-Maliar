//
//  BaseRequest.swift
//  RequestAPIData
//
//  Created by zein rezky chandra on 06/07/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseRequest: NSObject {

    static func GET_NOTIFICATION(isRead: Bool,
                    completionHandler: @escaping ([Notification]) -> Void) {
        
        let url = isRead ? Constants.GET_LEARNING_LIST : Constants.GET_LEARNING_LIST
        
        let header:HTTPHeaders = [
            "Authorization": "Bearer keysCSuJoizCcFgHS" ]
        
        var notificationCases : [Notification] = [Notification]()
        
        AF.request(url, method: .get, headers: header).responseData { data in
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
                        let newsCase =
                            Notification(
                                firebaseID: data["id"].stringValue ,
                                title: fields["NewsTitle"].stringValue,
                                dateReceived: createdTimeDate,
                                opened: fields["IsRead"].stringValue == "1" ? false : true)
                        notificationCases.append(newsCase)
                    }
                }
                completionHandler(notificationCases)
            } catch {
                print("Error handling JSON: \(error)")
            }
        }
 
    }
    
    static func POST(url: String,
                     header: [String: String],
                     type: String,
                     name: String,
                     status: String,
                     showLoader: Bool,
                     completionHandler: @escaping (Any) -> Void) {
        if showLoader {
            // display loader
        }
        //init request
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        
        //configure request method dan set header
        let jsonstring = """
                        {"records":[{"fields": {"type": "\(type)","Status": "\(status)","Namee": "\(name)"}}]}
                        """
        let jsonSessionData = jsonstring.data(using: .utf8)!
        let jsonSession = try! JSONSerialization.jsonObject(with: jsonSessionData, options: .allowFragments)
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonSession)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = header
        request.httpBody = jsonData

        //init session
        let session = URLSession.shared

        //init datatask dengan
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
