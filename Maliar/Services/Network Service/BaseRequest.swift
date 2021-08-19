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
}
