//
//  NotificationRow.swift
//  Maliar
//
//  Created by Nicholas on 05/08/21.
//

import SwiftUI

struct NotificationRow: View {
    var notification: Notification
    @State var hovering: Bool = false
    var onReadButtonClicked: (Notification) -> Void
    
    var body: some View {
        GroupBox {
            HStack {
                // if image available, change
                ZStack {
                    Color.accentColor
                    if let imageOfNews = notification.img {
                        Image(nsImage: imageOfNews)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .padding(.all, 10)
                    }
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(notification.notifTitle)
                        .foregroundColor(.primary)
                    Text("\(notification.getRelativeDate())")
                        .foregroundColor(.secondary)
                }
                Spacer()
                if hovering && !notification.opened {
                    Button {
                        // Action to delete
//                        notification.readNotif()
                        print("Button clicked")
                        self.onReadButtonClicked(notification)
                    } label: {
                        // xmark.circle.fill
                        Image(systemName: "r.circle.fill")
                        Text("Read")
                    }
                    .buttonStyle(LinkButtonStyle())
                    .foregroundColor(.accentColor)
                }
            }
            .padding(.all, 7)
        }
        .onHover { hovering in
            self.hovering = hovering
        }
        .cornerRadius(10)
    }
}


struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(notification: Notification(firebaseID: "asdfv", title: "SSS", dateReceived: Date(timeIntervalSinceNow: -1000000), opened: false)) {
            print("\($0) Should clear")
        }
    }
}
