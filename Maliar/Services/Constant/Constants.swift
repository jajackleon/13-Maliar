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
    static let POST_LEARNING = "https://api.airtable.com/v0/appcZaklzY11JKhVU/NewsScraping"
    static let LOOKUP_LIST = "https://api.airtable.com/v0/appcZaklzY11JKhVU/ProvinceLookUp?api_key=keysCSuJoizCcFgHS"
    static let KOMPAS_URL_EXTENSION = "?page=all"
    static var KOMPAS_URL = ""
    static var ANTARA_NEWS_URL = ""
    static var GOOGLE_SEARCH_URL = ""
    private static var API_KEY = "keysCSuJoizCcFgHS"
}
