//
//  DownloadShareButtonViewModel.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

class DownloadShareButtonViewModel: ObservableObject {
    var type: FileType
    var fileContent: Any
    
    // Universal init
    init(_ fileContent: Any) {
        if (fileContent as? NSImage) != nil {
            self.type = .image
        } else {
            self.type = .tableData
        }
        self.fileContent = fileContent
    }
    
    // Open dialog
    func openSaveDialog(fileContent: Any) {
        let savePanel = buildSavePanel()
        
        savePanel.begin { response in
            if response == .OK {
                do {
                    guard let url = savePanel.url else { return }
                    switch self.type {
                    case .tableData:
                        try (fileContent as! String).write(to: url, atomically: false, encoding: .utf8)
                    case .image:
                        print("Should save an NSImage to png")
                        if (fileContent as! NSImage).pngWrite(to: url) {
                            print("Image saved")
                        }
                    }
                } catch {
                    fatalError("Couldn't save the file! - \(error.localizedDescription)")
                }
            }
        }
    }
    
    func buildSavePanel() -> NSSavePanel {
        let savePanel = NSSavePanel()
        savePanel.title = type.savePanelTitle()
        savePanel.nameFieldLabel = type.nameFieldLabel()
        savePanel.nameFieldStringValue = type.fileName()
        savePanel.canCreateDirectories = true
        savePanel.allowedFileTypes = type.fileType()
        return savePanel
    }
    
    func generateFile() -> URL {
        var fileName = ""
        switch type {
        case .image:
            fileName = "Image.png"
        case .tableData:
            fileName = "Case.csv"
        }
        
        guard let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName) else { return URL(string: "")! }
        
        switch type {
        case .image:
            if (fileContent as! NSImage).pngWrite(to: path) {
                print("Image ready to share")
            }
        case .tableData:
            do {
                try (fileContent as! String).write(to: path, atomically: true, encoding: .utf8)
                print("CSV File ready to share")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        return path
    }
}
