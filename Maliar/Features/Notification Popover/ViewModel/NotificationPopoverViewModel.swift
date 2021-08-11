//
//  NotificationPopoverViewModel.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import SwiftUI

class NotificationPopoverViewModel: ObservableObject {
    // TODO: Raw data. Please replace this with data from the Database.
//    @Published var notifs: [Notification] = [
//        Notification(firebaseID: "asdfv", title: "SSS", dateReceived: Date(timeIntervalSinceNow: -3000000), opened: false),
//        Notification(firebaseID: "qwertz", title: "aaa", dateReceived: Date(timeIntervalSinceNow: -1500000), opened: false),
//        Notification(firebaseID: "azerty", title: "QWERT", dateReceived: Date(timeIntervalSinceNow: -1000000), opened: true),
//        Notification(firebaseID: "qzerty", title: "OPJfnmqa", image: NSImage(named: "notif_placeholder"), dateReceived: Date(timeIntervalSinceNow: -900000), opened: true),
//        Notification(firebaseID: "qwertz", title: "aaa", dateReceived: Date(timeIntervalSinceNow: -800000), opened: false),
//        Notification(firebaseID: "azerty", title: "QWERT", dateReceived: Date(timeIntervalSinceNow: -600000), opened: true),
//        Notification(firebaseID: "qzerty", title: "OPJfnmqa", image: NSImage(named: "notif_placeholder"), dateReceived: Date(timeIntervalSinceNow: -90000), opened: true),
//        Notification(firebaseID: "asdfv", title: "SSS", dateReceived: Date(timeIntervalSinceNow: -10000), opened: false),
//        Notification(firebaseID: "qwertz", title: "aaa", dateReceived: Date(timeIntervalSinceNow: -5000), opened: false),
//        Notification(firebaseID: "azerty", title: "QWERT", dateReceived: Date(timeIntervalSinceNow: -3000), opened: true),
//        Notification(firebaseID: "qzerty", title: "OPJfnmqa", image: NSImage(named: "notif_placeholder"), dateReceived: Date(timeIntervalSinceNow: -800), opened: true),
//        Notification(firebaseID: "asdfv", title: "SSS", dateReceived: Date(timeIntervalSinceNow: -500), opened: false)
//    ]
    
    @Published var notifs: [Notification] = [Notification]()
    @Published var sorted = [Notification]()
    @Published var showingOpened = true
    
    // run method on Jackie's view to clear all
    func clearAll() {
        notifs.removeAll()
    }
    
    func readNotif(_ notific: Notification) {
        for (idx, notif) in notifs.enumerated() {
            if notif.id == notific.id {
                notifs[idx].opened = true
            }
        }
        
        if showingOpened {
            showUnread()
        }
    }
    
    func readAll() {
        for (idx, _) in notifs.enumerated() {
            notifs[idx].opened = true
        }
        showUnread()
    }
    
    func showUnread() {
        showingOpened = true
        sorted = notifs.filter { notifFil in
            return !notifFil.opened
        }
    }
    
    func showAllNotif() {
        showingOpened = false
        sorted = notifs
    }
}
