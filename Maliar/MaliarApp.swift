//
//  MaliarApp.swift
//  Maliar
//
//  Created by Nicholas on 27/07/21.
//

import SwiftUI

@main
struct MaliarApp: App {
    
    var body: some Scene {
        WindowGroup {
            SidebarView()
                .frame(minWidth: 1236, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 600, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
