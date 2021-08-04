//
//  DownloadShareButtonViewModel.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

class DownloadShareButtonViewModel: ObservableObject {
    
    // Open dialog
    func openSaveDialog(fileContent: Any) {
        var fileType: FileType
        if (fileContent as? NSImage) != nil {
            fileType = .image
        } else {
            fileType = .tableData
        }
        let savePanel = buildSavePanel(fileType)
        
        savePanel.begin { response in
            if response == .OK {
                do {
                    guard let url = savePanel.url else { return }
                    
                    if (fileContent as? NSImage) != nil {
                        print("Should save an NSImage to png")
                        if (fileContent as! NSImage).pngWrite(to: url) {
                            print("Image saved")
                        }
                    } else {
                        try (fileContent as! String).write(to: url, atomically: false, encoding: .utf8)
                    }
                } catch {
                    fatalError("Couldn't save the file! - \(error.localizedDescription)")
                }
            }
        }
    }
    
    func buildSavePanel(_ type: FileType) -> NSSavePanel {
        let savePanel = NSSavePanel()
        savePanel.title = type.savePanelTitle()
        savePanel.nameFieldLabel = type.nameFieldLabel()
        savePanel.nameFieldStringValue = type.fileName()
        savePanel.canCreateDirectories = true
        savePanel.allowedFileTypes = type.fileType()
        return savePanel
    }
    
    func generateFile(fileContent: Any) -> URL {
        var type: FileType
        var fileName = ""
        if (fileContent as? NSImage) != nil {
            fileName = "Image.png"
            type = .image
        } else {
            fileName = "Case.csv"
            type = .tableData
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
