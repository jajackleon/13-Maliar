//
//  NotificationPopoverViewModel.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import SwiftUI

class NotificationPopoverViewModel: ObservableObject {
    
    @Published var notifs: [Notification] = [Notification]()
    @Published var sorted = [Notification]()
    @Published var showingOpened = true
    @Published var unreadNotifs = 0
    
    func readNotif(_ notific: Notification) {
        for (idx, notif) in notifs.enumerated() {
            if notif.id == notific.id {
                notifs[idx].opened = true
                APIRequest.updateNewsCase(documentID: notifs[idx].firebaseID, tableCell: TableCell.isRead, updatedData: "0") {
                }
            }
        }
        if showingOpened {
            showUnread()
        }
    }
    
    func readAll() {
        for (idx, _) in notifs.enumerated() {
            if !notifs[idx].opened{
                APIRequest.updateNewsCase(documentID: notifs[idx].firebaseID, tableCell: TableCell.isRead, updatedData: "0") {
                }
            }
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
        print("showallnotif \(sorted.count)")
    }
    
    func countUnread() -> Int {
        let unreadCount = sorted.count { unread in
            return !unread.opened
        }
        
        return unreadCount
    }
}
