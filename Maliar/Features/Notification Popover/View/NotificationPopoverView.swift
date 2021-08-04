//
//  NotificationPopoverView.swift
//  Maliar
//
//  Created by Nicholas on 04/08/21.
//

import SwiftUI

struct NotificationPopoverView: View {
    @State var sliderValue: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Where the buttons are
            HStack {
                Button("Unread") {
                    
                }
                Button("All Notification") {
                    
                }
                Spacer()
                Button("Clear all") {
                    
                }
            }
            Divider()
            // Where to see the notification
            ScrollView {
                
            }
        }
        .frame(width: 300, height: 550)
    }
}

struct NotificationPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPopoverView()
    }
}
