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
        APIRequest.updateNewsCase(documentID: notific.firebaseID, tableCell: TableCell.isRead, updatedData: "0") {
            self.loadNotification {
                if self.showingOpened {
                    self.showUnread()
                }
            }
        }
    }
    
    func loadNotification(_ completion: @escaping () -> ()) {
        // Show unread news
        APIRequest.fetchNotification(isRead: true) { (notifications) in
            self.notifs.removeAll()
            self.notifs = notifications
            completion()
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
        sorted = notifs.filter({ notif in
            !notif.opened
        })
    }
    
    func showAllNotif() {
        showingOpened = false
        sorted = notifs
    }
    
    func countUnread() -> Int {
        let unreadCount = sorted.count { unread in
            return !unread.opened
        }
        return unreadCount
    }
}
