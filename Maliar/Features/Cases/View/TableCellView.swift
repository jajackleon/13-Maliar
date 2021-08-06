//
//  TableCellView.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import SwiftUI

struct TableCellView: View {
    var property: Any
    
    // String init:
    init(text: String) {
        self.property = text
    }
    
    // URL init:
    init(url: URL) {
        self.property = url
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
                .border(Color.gray, width: 1)
            if let string = property as? String {
                Text(property as! String)
                    .padding(5)
            } else {
                // Button to Safari link
                let url = property as! URL
                Button {
                    NSWorkspace.shared.open(url)
                } label: {
                    Text(url.absoluteString)
                        .padding(5)
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct TableCellView_Previews: PreviewProvider {
    static var previews: some View {
        TableCellView(text: "AAA")
    }
}
