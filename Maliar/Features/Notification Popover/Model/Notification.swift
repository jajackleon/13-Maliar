//
//  Notification.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import SwiftUI

struct Notification {
    var id = UUID()
    var firebaseID: String
    var notifTitle: String
    var img: NSImage?
    var dateReceived: Date
    var opened: Bool
    
    init(firebaseID: String, title: String, image: NSImage? = nil, dateReceived: Date, opened: Bool) {
        self.firebaseID = firebaseID
        self.notifTitle = title
        self.img = image
        self.dateReceived = dateReceived
        self.opened = opened
    }
    
    // Read data
    mutating func readNotif() {
        self.opened = true
    }
    
    // Get time frame
    func getRelativeDate() -> String {
        let rdtm = RelativeDateTimeFormatter()
        rdtm.dateTimeStyle = .named
        return rdtm.localizedString(for: dateReceived, relativeTo: Date())
    }
}
