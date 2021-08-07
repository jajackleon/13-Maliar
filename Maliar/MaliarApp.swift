//
//  MaliarApp.swift
//  Maliar
//
//  Created by Nicholas on 27/07/21.
//

import SwiftUI
import Firebase

@main
struct MaliarApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SidebarView()
        }
    }
}
