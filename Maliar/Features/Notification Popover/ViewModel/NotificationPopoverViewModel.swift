//
//  NotificationPopoverViewModel.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import Foundation

class NotificationPopoverViewModel: ObservableObject {
    @Published var notifs: [Notification] = [
        Notification(opened: false),
        Notification(opened: false),
        Notification(opened: true),
        Notification(opened: true),
        Notification(opened: true)
    ]
    @Published var sorted = [Notification]()
    @Published var showingOpened = true
    
    // run method on Jackie's view to clear all
    func clearAll() {
        notifs.removeAll()
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
