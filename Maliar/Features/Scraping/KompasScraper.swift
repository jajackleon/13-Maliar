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
    private var kompasDoc: Document? = nil
    
    private func fetchDoc(url: String){
        do {
            let kompas = try String(contentsOf: URL(string: "https://www.kompas.com/tren/read/2021/08/04/213238365/bagaimana-jika-janji-sumbangan-rp-2-triliun-tidak-direalisasikan" + Constant.KOMPAS_URL_EXTENSION)!)

        kompasDoc = try SwiftSoup.parse(kompas)
        } catch Exception.Error( _, let message) {
            print(message)
        } catch {
            print("error in getting kompas HTML URL")
        }
    }
    
    func getBerita(url: String) -> String{
        var berita: [String] = []
        
        do {
            fetchDoc(url: url)
            let content = try kompasDoc!.select("div.read__content").array()
            
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
        } catch Exception.Error( _, let message) {
            return message
        } catch {
            return("error in Getting Berita")
        }
    }
    
    func getTitle(url: String) -> String{
        do{
            fetchDoc(url: url)

            let title = try kompasDoc!.select("title").text()

            print("Title ==> \(title)")

            return title
        } catch Exception.Error( _, let message) {
            return message
        } catch {
            return("error")
        }
    }

    func getNewsTime(url: String) -> String{
        
        do{
            fetchDoc(url: url)

            let newsTime = try kompasDoc!.select("meta[name=content_PublishedDate]").attr("content")

            return newsTime
        } catch Exception.Error(_, let message) {
            return message
        } catch {
            return("error in getting News Time")
        }
    }
}
