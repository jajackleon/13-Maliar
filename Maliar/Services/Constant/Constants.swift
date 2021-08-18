//
//  Constant.swift
//  RequestAPIData
//
//  Created by zein rezky chandra on 06/07/21.
//  Copyright © 2021 Haryanto Salim. All rights reserved.
//

import Foundation

class Constants: NSObject {
    static let GET_LEARNING_LIST = "https://api.airtable.com/v0/appcZaklzY11JKhVU/NewsScraping"
    static let GET_LEARNING_LIST_NEWEST = "https://api.airtable.com/v0/appcZaklzY11JKhVU/NewsScraping?view=Newest"
    static let GET_LEARNING_LIST_OLDEST = "https://api.airtable.com/v0/appcZaklzY11JKhVU/NewsScraping?view=Oldest"
    static let GET_LEARNING_LIST_UNREAD_NOTIFICATION = "https://api.airtable.com/v0/appcZaklzY11JKhVU/NewsScraping?view=UnreadNotification"
    static let GET_LEARNING_LIST_READ_NOTIFICATION = "https://api.airtable.com/v0/appcZaklzY11JKhVU/NewsScraping?view=ReadNotification"
    static let POST_LEARNING = "https://api.airtable.com/v0/appcZaklzY11JKhVU/NewsScraping"
    static let LOOKUP_LIST = "https://api.airtable.com/v0/appcZaklzY11JKhVU/maxRecords=10&view=TopProvince"
    
    static let KOMPAS_URL_EXTENSION = "?page=all"
    private static var API_KEY = "keysCSuJoizCcFgHS"
}
