//
//  DataRequestScheduler.swift
//  Maliar
//
//  Created by Jackie Leonardy on 18/08/21.
//

import Foundation

class DataRequestScheduler{
    static var shared = DataRequestScheduler()
    let activity = NSBackgroundActivityScheduler(identifier: "com.example.Maliar.updatechecks")
    
    func startScheduler() {
        
        activity.interval = TimeInterval(10*60)
        activity.repeats = true
        activity.qualityOfService = .userInteractive
        activity.tolerance = TimeInterval(1)
        activity.schedule { (completion: NSBackgroundActivityScheduler.CompletionHandler) in
            
            GoogleCrawler.shared.crawl(){
                
            }
            
            if self.activity.shouldDefer {
                completion(NSBackgroundActivityScheduler.Result.deferred)
            } else {
                completion(NSBackgroundActivityScheduler.Result.finished)
            }
        }
        
    }
}
