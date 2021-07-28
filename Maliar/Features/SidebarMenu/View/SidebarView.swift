//
//  ContentView.swift
//  Maliar
//
//  Created by Nicholas on 27/07/21.
//

import SwiftUI

struct SidebarView: View {
    @StateObject var viewModel = SidebarViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    
                } label: {
                    Image(systemName: "clock")
                    Text("Updates")
                }
                .buttonStyle(PlainButtonStyle())
                ForEach(
                    viewModel.menuItems,
                    id: \.hashValue
                ) { menu in
                    NavigationLink(
                        destination: menu.getContainingView(),
                        tag: menu,
                        selection: $viewModel.selection) {
                        menu.getImage()
                        Text(menu.rawValue)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .toolbar {
                Button(action: viewModel.toggleSidebar) {
                    Image(systemName: "sidebar.left")
                        .help("Toggle Sidebar")
                }
            }
        }
    }
}

struct SidebarMenu_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
