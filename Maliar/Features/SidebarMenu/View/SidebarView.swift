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
                    ZStack {
                        Color(.displayP3, red: 0.01, green: 0.01, blue: 0.01, opacity: 0.01)
                            .cornerRadius(4)
                        HStack {
                            Image(systemName: "bell")
                            Text("Notification")
                            Spacer()
                            if notificationViewModel.unreadNotifs > 0 {
                                // based on how many received notif
                                Text("\(notificationViewModel.unreadNotifs)")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 5)
                                    .background(Color.red)
                                    .cornerRadius(4)
                            }
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
        }
        .onAppear {
            APIRequest.fetchNotification(isRead: true) { (notifications) in
                notificationViewModel.notifs.removeAll()
                notificationViewModel.notifs = notifications
                notificationViewModel.showUnread()
                notificationViewModel.unreadNotifs = notificationViewModel.countUnread()
            }
        }
        .onChange(of: notificationViewModel.sorted.count) { value in
            // Reload the unread notif value
            notificationViewModel.unreadNotifs = notificationViewModel.countUnread()
        }
    }
}

struct SidebarMenu_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
