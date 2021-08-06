//
//  SidebarViewModel.swift
//  Maliar
//
//  Created by Nicholas on 28/07/21.
//

import Foundation
import SwiftUI

class SidebarViewModel: ObservableObject {
    @Published var menuItems = SidebarMenu.allCases
    @Published var selection: SidebarMenu? = .trends
    @Published var notificationPopoverShown: Bool = false
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
    func showPopover() {
        notificationPopoverShown.toggle()
    }
}
