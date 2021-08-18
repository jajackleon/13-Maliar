//
//  TableCellView.swift
//  Maliar
//
//  Created by Nicholas on 03/08/21.
//

import SwiftUI

struct TableCellView: View {
    @Binding var isEditing: Bool
    @Binding var stringValue: String
    @Binding var url: URL? {
        didSet {
            if let url = url {
                stringValue = url.absoluteString
            }
        }
    }
    private var cellColumn: TableCell?
    private var caseID: String?
    
    // Constant String init
    init(text: String) {
        self._url = .constant(nil)
        self._stringValue = .constant(text)
        self._isEditing = .constant(false)
    }
    
    // String init editable:
    init(text: Binding<String>, isEditing: Binding<Bool>) {
        self._url = .constant(nil)
        self._stringValue = text
        self._isEditing = isEditing
    }
    
    init(text: Binding<String>, isEditing: Binding<Bool>, cellColumn: TableCell, caseID: String) {
        self._url = .constant(nil)
        self._stringValue = text
        self._isEditing = isEditing
        self.cellColumn = cellColumn
        self.caseID = caseID
    }
    
    // URL init editable:
    init(url: Binding<URL?>, isEditing: Binding<Bool>) {
        self._stringValue = .constant("")
        self._url = url
        self._isEditing = isEditing
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
                .border(Color.gray, width: 1)
            
            // if editing or not, change to text field
            if isEditing {
                // if true, change to textfield
                TextField("", text: $stringValue) { isEditing in
                } onCommit: {
                    APIRequest.updateNewsCase(documentID: caseID ?? "", tableCell: cellColumn ?? .null, updatedData: self._stringValue.wrappedValue) {
                    }
                }
                .padding(5)

            } else {
                // if false, show text or button
                if let url = url {
                    Button {
                        NSWorkspace.shared.open(url)
                    } label: {
                        Text(url.absoluteString)
                            .padding(5)
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    Text(stringValue)
                        .padding(5)
                }
            }
        }
    }
}

struct TableCellView_Previews: PreviewProvider {
    static var previews: some View {
        TableCellView(text: "AAA")
    }
}
