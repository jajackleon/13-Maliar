//
//  TableCellView.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import SwiftUI

struct TableCellView: View {
    var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
                .border(Color.gray, width: 1)
            Text(text)
                .padding(5)
        }
    }
}

struct TableCellView_Previews: PreviewProvider {
    static var previews: some View {
        TableCellView(text: "AAA")
    }
}
