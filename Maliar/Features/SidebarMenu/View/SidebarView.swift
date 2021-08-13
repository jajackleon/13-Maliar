//
//  ContentView.swift
//  Maliar
//
//  Created by Nicholas on 27/07/21.
//

import SwiftUI

struct SidebarView: View {
    @StateObject var viewModel = SidebarViewModel()
    @StateObject var notificationViewModel = NotificationPopoverViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    viewModel.showPopover()
                } label: {
                    HStack {
                        Image(systemName: "bell")
                        Text("Notification")
                        Spacer()
                        if notificationViewModel.sorted.count > 0 {
                            Text("\(notificationViewModel.sorted.count)") // based on how many received notif
                                .foregroundColor(.white)
                                .padding(.horizontal, 5)
                                .background(Color.red)
                                .cornerRadius(4)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .popover(isPresented: $viewModel.notificationPopoverShown, arrowEdge: .leading) {
                    NotificationPopoverView(viewModel: self.notificationViewModel, sidebarVM: self.viewModel)
                }
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
        }.onAppear(){
            APIRequest.fetchNotification(isRead: true) { (notifications) in
                notificationViewModel.notifs.removeAll()
                notificationViewModel.notifs = notifications
                notificationViewModel.showUnread()
            }
        }
    }
}

struct SidebarMenu_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
