//
//  Crawler.swift
//  WebScrape
//
//  Created by Jackie Leonardy on 05/08/21.
//

import Foundation
import SwiftSoup

class GoogleCrawler {
    
    static var shared = GoogleCrawler()
    var links:Set = Set<String>()
    func crawl(){
        do {
            let content =
                try String(contentsOf: URL(string: "https://www.google.com/search?q=berita+fauna&rlz=1C5CHFA_enID944ID944&sxsrf=ALeKk000Udq79oDLLgBTd2XtQjcOOM1nWg:1627483357097&source=lnms&tbm=nws&sa=X&ved=2ahUKEwj4lIL7_4XyAhW7-nMBHULZAeAQ_AUoAnoECAEQBA&biw=1792&bih=1040")!)
                
            let doc: Document = try SwiftSoup.parse(content)
            
            let data = try doc.select("div.kCrYT")
            try data.forEach{ data in
                let link = try data.select("a").first()!.attr("href")
                var trimmedLink = link.replacingOccurrences(of: "/url?q=", with: "")
                
                if let index = (trimmedLink.range(of: "&sa")?.lowerBound)
                {
                    //prints "element="
                    trimmedLink = String(trimmedLink.prefix(upTo: index))
                }
                links.insert(trimmedLink)
            }
            
            links.forEach{ link in
                print(link)
            }
            
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }

//        print(try! doc.select("h1.Uo8X3b").first()!)
//        let test = try! doc.select("div").first()!
//        print(test)
//
//        try! doc.select("div#rso").forEach{
//            _ = try! $0.select("g-card").compactMap{ datass throws -> [Element]? in
//                tagData.append(datass)
//                return tagData
//            }
//
//            for newData in tagData{
//                let data3 = try! newData.select("div.mnr-c").first()!
//                let data4 = try! data3.select("div.dbsr").first()!
//                let datas = try! data4.select("a").first()!.attr("href")
//                print(datas)
//            }
//        }
    }
}
