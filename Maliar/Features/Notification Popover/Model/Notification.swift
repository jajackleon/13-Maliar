//
//  Notification.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import SwiftUI

struct Notification {
    var id = UUID()
    var img = NSImage()
    var notifTitle: String = ""
    var dateReceived: Date = Date()
    var opened: Bool
}
