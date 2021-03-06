//
//  NotificationPopoverView.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import SwiftUI

struct NotificationPopoverView: View {
    @StateObject var viewModel : NotificationPopoverViewModel
    @StateObject var sidebarVM: SidebarViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Where the buttons are
            HStack {
                Button {
                    viewModel.showUnread()
                } label: {
                    VStack {
                        Text("Unread")
                            .foregroundColor(.primary)
                            .padding()
                            .border(width: 1, edges: [.bottom], color: viewModel.showingOpened ? Color.accentColor : Color.clear)
                    }
                }
                .buttonStyle(LinkButtonStyle())
                Button {
                    viewModel.showAllNotif()
                } label: {
                    VStack {
                        Text("All Notification")
                            .foregroundColor(.primary)
                            .padding()
                            .border(width: 1, edges: [.bottom], color: viewModel.showingOpened ? Color.clear : Color.accentColor)
                    }
                }
                .buttonStyle(LinkButtonStyle())
                Spacer()
                if viewModel.showingOpened {
                    Button {
                        viewModel.readAll()
                    } label: {
                        Text("Read All")
                            .foregroundColor(.accentColor)
                            .padding()
                    }
                    .buttonStyle(LinkButtonStyle())
                }
            }
            Divider()
            // Where to see the notification
            notifTable
        }
        .onAppear {
            viewModel.loadNotification {
                viewModel.showUnread()
            }
        }
        .frame(width: 350, height: 550)
    }
    
    @ViewBuilder
    var notifTable: some View {
        if viewModel.sorted.count == 0 {
            Spacer()
            Image("notif_placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            Text("All caught up!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .padding()
            Spacer()
        } else {
            List {
                ForEach(viewModel.sorted) { element in
                    Button {
                        viewModel.readNotif(element)
                        sidebarVM.openFromNotif()
                    } label: {
                        NotificationRow(notification: element) {
                            viewModel.readNotif($0)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct NotificationPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPopoverView(viewModel: NotificationPopoverViewModel(), sidebarVM: SidebarViewModel())
    }
}
