//
//  AntaraScraper.swift
//  WebScrape
//
//  Created by Jackie Leonardy on 06/08/21.
//

import Foundation
import SwiftSoup

class AntaraScraper{
    static var shared = AntaraScraper()
    
    func fetchDoc(){
        
        do {
            let antaraNews = try String(contentsOf: URL(string: "https://www.antaranews.com/berita/2311310/kampus-pariwisata-diminta-produktif-dan-lakukan-inovasi-saat-pandemi")!)
            let antaraDoc : Document = try SwiftSoup.parse(antaraNews)
            let title = try antaraDoc.select("h1.post-title").text()
            let time = try antaraDoc.select("h1.post-title + p").text()
            let berita = try antaraDoc.select("div.post-content").text()
            
            
            print("title => \(title)")
            print("time => \(time)")
            print()
            print(berita)
        } catch Exception.Error( _, let message) {
            print(message)
        } catch {
            print("error")
        }

    }
    
    
}
