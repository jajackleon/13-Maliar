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
    private var antaraDoc: Document? = nil
    
    private func fetchDoc(url: String){
        do {
            let antara = try String(contentsOf: URL(string: url)!)

            antaraDoc = try SwiftSoup.parse(antara)
        } catch Exception.Error( _, let message) {
            print(message)
        } catch {
            print("error in getting kompas HTML URL")
        }
    }
    
    func getBerita(url: String) -> String{
        do {
            fetchDoc(url: url)
            let berita = try antaraDoc!.select("div.post-content").text()
            
            return berita
        } catch Exception.Error( _, let message) {
            return message
        } catch {
            return "error"
        }
    }
    
    func getTitle(url: String) -> String{
        do {
            fetchDoc(url: url)
            let title = try antaraDoc!.select("h1.post-title").text()

            return title
        } catch Exception.Error( _, let message) {
            return message
        } catch {
            return "error"
        }
    }
    
    func getNewsTime(url: String) -> String{
        do {
            fetchDoc(url: url)
            let time = try antaraDoc!.select("h1.post-title + p").text()

            return time
        } catch Exception.Error( _, let message) {
            return message
        } catch {
            return "error"
        }
    }
    
    
}
