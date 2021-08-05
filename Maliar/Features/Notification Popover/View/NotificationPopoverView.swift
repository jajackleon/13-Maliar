//
//  NotificationPopoverView.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import SwiftUI

struct NotificationPopoverView: View {
    @StateObject var viewModel = NotificationPopoverViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Where the buttons are
            HStack {
                Button {
                    viewModel.showUnread()
                } label: {
                    VStack {
                        Text("Unread")
                            .padding()
                            .border(width: 1, edges: [.bottom], color: viewModel.showingOpened ? Color.accentColor : Color.clear)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Button {
                    viewModel.showAllNotif()
                } label: {
                    VStack {
                        Text("All Notification")
                            .padding()
                            .border(width: 1, edges: [.bottom], color: viewModel.showingOpened ? Color.clear : Color.accentColor)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
                if viewModel.showingOpened {
                    Button {
                        viewModel.readAll()
                    } label: {
                        Text("Read All")
                            .padding()
                    }
                    .buttonStyle(LinkButtonStyle())
                    .accentColor(.accentColor)
                }
            }
            Divider()
            // Where to see the notification
            List(viewModel.sorted, id: \.id) { element in
                NotificationRow(notification: element)
            }
        }
        .onAppear {
            // Show unread news
            viewModel.showUnread()
        }
        .frame(width: 350, height: 550)
    }
}

struct NotificationPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPopoverView()
    }
}
