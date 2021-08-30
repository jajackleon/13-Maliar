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
    var selectedLink : [String] = [String]()
    
    private var penyelundupan = "https://www.google.com/search?q=penyelundupan+satwa&rlz=1C5CHFA_enID944ID944&sxsrf=ALeKk00LPPhHv-n1VLlm_wFKW44ySeAZ0w:1629188668261&source=lnms&tbm=nws&sa=X&sqi=2&ved=2ahUKEwj9tt_e0LfyAhUiC9QKHZftB7YQ_AUoAXoECAEQAw&biw=1792&bih=1009"
    private var penyitaan = "https://www.google.com/search?q=penyitaan+satwa&rlz=1C5CHFA_enID944ID944&sxsrf=ALeKk00gXLkfd-U9dWI8MRCV6tYZn2FQ5A:1629188814958&source=lnms&tbm=nws&sa=X&ved=2ahUKEwjzjNmk0bfyAhVOH7cAHfI5AkgQ_AUoAXoECAEQAw&biw=1792&bih=1009"
    private var perdagangan = "https://www.google.com/search?q=perdagangan+satwa+liar&rlz=1C5CHFA_enID944ID944&sxsrf=ALeKk00gXLkfd-U9dWI8MRCV6tYZn2FQ5A:1629188814958&source=lnms&tbm=nws&sa=X&ved=2ahUKEwjzjNmk0bfyAhVOH7cAHfI5AkgQ_AUoAXoECAEQAw&biw=1792&bih=1009"
    private var perburuan = "https://www.google.com/search?q=perburuan+satwa+liar&rlz=1C5CHFA_enID944ID944&sxsrf=ALeKk00gXLkfd-U9dWI8MRCV6tYZn2FQ5A:1629188814958&source=lnms&tbm=nws&sa=X&ved=2ahUKEwjzjNmk0bfyAhVOH7cAHfI5AkgQ_AUoAXoECAEQAw&biw=1792&bih=1009"
    
    var baseLinks: [String]{
        get{
            return [penyelundupan, penyitaan, perdagangan]
        }
    }
    
    func crawl(completion: @escaping () -> ()){
        links.removeAll()
        baseLinks.forEach { baseLink in
            print(baseLink)
            for i in stride(from: 0, to: 40, by: 10) {
                do {
                    let content = try String(contentsOf: URL(string: baseLink + "&start=\(i)")!)
                    
                    let doc: Document = try SwiftSoup.parse(content)
                    let data = try doc.select("div.kCrYT")
                    data.forEach{ data in
                        
                        guard let link = try? data.select("a").first()?.attr("href") else{
                            return
                        }
                        var trimmedLink = link.replacingOccurrences(of: "/url?q=", with: "")
                        
                        if let index = (trimmedLink.range(of: "&sa")?.lowerBound)
                        {
                            trimmedLink = String(trimmedLink.prefix(upTo: index))
                        }
                        links.insert(trimmedLink)
                    }
                    links.forEach{ link in
                        if link.contains("kompas") {
                            let news = KompasScraper.shared.getTitle(url: link)
                            let newsTitle = KompasScraper.shared.getBerita(url: link)
                            let prediction = ML3Helper.getNewsPrediction(input: news)
                            
                            if prediction != "others" {
//                                ML1Helper.getTagger(input: news, newsTitle: newsTitle, newsLink: link)
                            }
                            print(ML3Helper.getNewsPrediction(input: news))
                        }
                        else if link.contains("antaranews") {
                            let news = AntaraScraper.shared.getTitle(url: link)
                            let newsTitle = AntaraScraper.shared.getBerita(url: link)
                            
                            let prediction = ML3Helper.getNewsPrediction(input: news)
                            
                            if prediction != "others" {
//                                ML1Helper.getTagger(input: news, newsTitle: newsTitle, newsLink: link)
                            }
                            print(ML3Helper.getNewsPrediction(input: news))
                        }
                    }
                    
                } catch Exception.Error(_, let message) {
                    print(message)
                } catch {
                    print("error")
                }
            }
        }
        links.removeAll()
        completion()
    }
}
