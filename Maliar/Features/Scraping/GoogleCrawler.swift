//
//  Crawler.swift
//  WebScrape
//
//  Created by Jackie Leonardy on 05/08/21.
//

import Foundation
import SwiftSoup

class GoogleCrawler {
    private var tagData = [Element]()
    
    static var shared = GoogleCrawler()
    
    func crawl(){
        do {
           let html = "<html><head><title>First parse</title></head>"
               + "<body><p>Parsed HTML into a doc.</p></body></html>"
           let doc: Document = try SwiftSoup.parse(html)
           print(try doc.text())
        } catch Exception.Error(let type, let message) {
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
