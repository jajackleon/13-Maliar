//
//  DownloadShareButtonView.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

struct DownloadShareButtonView: View {
    var viewModel = DownloadShareButtonViewModel()
    @Binding var imageItem: NSImage
    @Binding var textItem: String
    
    init(textItem: Binding<String>) {
        self._textItem = textItem
        self._imageItem = .constant(NSImage())
    }
    
    init(imageItem: Binding<NSImage>) {
        self._textItem = .constant("")
        self._imageItem = imageItem
    }
    
    var body: some View {
        HStack {
            // Download Menu
            Button {
                // Show Finder window
                if textItem.isEmpty {
                    // opensavedialog for image file
                    viewModel.openSaveDialog(fileContent: imageItem)
                } else {
                    viewModel.openSaveDialog(fileContent: textItem)
                }
            } label: {
                Image(systemName: "square.and.arrow.down")
            }
            .help("Download")
            Menu {
                ForEach(
                    NSSharingService
                        .sharingServices(forItems: [""]),
                    id: \.title
                ) { item in
                    Button {
                        // Action for each button
                        if textItem.isEmpty {
                            item.perform(withItems: [viewModel.generateFile(fileContent: imageItem)])
                        } else {
                            item.perform(withItems: [viewModel.generateFile(fileContent: textItem)])
                        } // can be changed depends on the view
                    } label: {
                        Image(nsImage: item.image)
                        Text(item.title)
                    }
                }
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .help("Share")
        }
    }
}

struct DownloadShareButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadShareButtonView(textItem: .constant("ASDFGhjjkkl"))
    }
}
