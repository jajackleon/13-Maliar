//
//  TableHeaderView.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import SwiftUI

struct TableHeaderView: View {
    var title: TableHeader
    var sortable: Bool
    var action: (TableHeader) -> Void
    
    // Title only, not sortable
    init(_ title: TableHeader) {
        self.title = title
        self.sortable = false
        self.action = { variable in return }
    }
    
    // Title and sortable
    init(_ title: TableHeader, sortAction: @escaping (TableHeader) -> Void) {
        self.title = title
        self.sortable = true
        self.action = sortAction
    }
    
    var body: some View {
        ZStack {
            Color.accentColor
                .border(Color.gray)
            HStack {
                Text(title.rawValue)
                    .foregroundColor(.white)
                Spacer()
                if sortable {
                    Button {
                        action(title)
                    } label: {
                        Image(systemName: "arrow.up.arrow.down")
                    }
                }
            }
            .padding(5)
        }
    }
}

struct TableHeader_Previews: PreviewProvider {
    static var previews: some View {
        TableHeaderView(.number)
    }
}
