//
//  FileType.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import Foundation

enum FileType {
    case tableData
    case image
    
    func savePanelTitle() -> String {
        switch self {
        case .tableData:
            return "Save Spreadsheet"
        case .image:
            return "Save Image"
        }
    }
    
    func nameFieldLabel() -> String {
        switch self {
        case .tableData:
            return "File Name:"
        case .image:
            return "Image Name:"
        }
    }
    
    func fileName() -> String {
        let today = Date()
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .medium
        switch self {
        case .tableData:
            return "Table - \(df.string(from: today)).csv"
        case .image:
            return "Image - \(df.string(from: today)).png"
        }
    }
    
    func fileType() -> [String] {
        switch self {
        case .tableData:
            return ["csv"]
        case .image:
            return ["png"]
        }
    }
}
