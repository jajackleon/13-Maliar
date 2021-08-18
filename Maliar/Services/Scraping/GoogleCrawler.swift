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
        baseLinks.forEach { baseLink in
            print(baseLink)
            for i in stride(from: 0, to: 40, by: 10) {
                print("i == > \(i)")
                do {
                    let content = try String(contentsOf: URL(string: baseLink + "&start=\(i)")!)
                    
                    let doc: Document = try SwiftSoup.parse(content)
                    let data = try doc.select("div.kCrYT")
                    try data.forEach{ data in
                            let link = try data.select("a").first()!.attr("href")
                            var trimmedLink = link.replacingOccurrences(of: "/url?q=", with: "")
                            
                            if let index = (trimmedLink.range(of: "&sa")?.lowerBound)
                            {
                                trimmedLink = String(trimmedLink.prefix(upTo: index))
                            }
                            links.insert(trimmedLink)
                    }
                    links.forEach{ link in
//                        print(link)
                        if link.contains("kompas"){
                            print(KompasScraper.shared.getTitle(url: link))
                        }
                        else if link.contains("antaranews"){
                            print(AntaraScraper.shared.getTitle(url: link))
                        }
                    }
                    
                } catch Exception.Error(_, let message) {
                    print(message)
                } catch {
                    print("error")
                }
            }
        }
        print(links.count)
        completion()
    }
}
