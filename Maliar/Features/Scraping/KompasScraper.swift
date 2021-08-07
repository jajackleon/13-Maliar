//
//  KompasScraper.swift
//  WebScrape
//
//  Created by Jackie Leonardy on 06/08/21.
//

import Foundation
import SwiftSoup

class KompasScraper {
    static var shared = KompasScraper()
    private var tagData = [Element]()
    
    private func fetchDoc(url: String) -> Element{
        let kompas = try! String(contentsOf: URL(string: "https://www.kompas.com/tren/read/2021/08/04/213238365/bagaimana-jika-janji-sumbangan-rp-2-triliun-tidak-direalisasikan" + Constant.KOMPAS_URL_EXTENSION)!)
        
        let kompasDoc: Document = try! SwiftSoup.parse(kompas)
        return kompasDoc
    }
    
    func getBerita(url: String) -> String{
        var berita: [String] = []
        
        let kompasDoc = fetchDoc(url: url)
        
        let content = try! kompasDoc.select("div.read__content").array()
        
        content.forEach { row in
            let cells = try! row.select("p").array()
            _ = try! cells.compactMap{
                datass throws -> [Element]? in
                    tagData.append(datass)
                    return tagData
            }
            for newDatas in tagData{
                if !(try! newDatas.select("strong").hasText()){
                    berita.append(try! newDatas.text())
                }
            }
        }
        
        berita = berita.filter{
            !$0.isEmpty
        }
        
        let beritaString = berita.joined(separator: " ")
        
        return beritaString
    }
    
    func getTitle(url: String) -> String{
        let kompasDoc = fetchDoc(url: url)
        
        let title = try!kompasDoc.select("title").text()
        
        print("Title ==> \(title)")
        
        return title
    }
    
    func getNewsTime(url: String) -> String{
        let kompasDoc = fetchDoc(url: url)
        
        let newsTime = try! kompasDoc.select("meta[name=content_PublishedDate]").attr("content")
        
        return newsTime
    }
}
