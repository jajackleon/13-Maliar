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
    
    var body: some View {
        GroupBox {
            HStack {
                ZStack {
                    Color.accentColor
                    
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding(.all, 10)
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text("Kukang is currently trending")
                        .foregroundColor(.primary)
                    Text("Now")
                        .foregroundColor(.secondary)
                }
                Spacer()
                if hovering {
                    Button {
                        // Action to delete
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(PlainButtonStyle())
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
        NotificationRow(notification: Notification(opened: false))
    }
}
