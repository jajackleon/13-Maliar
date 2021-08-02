//
//  DownloadShareButtonView.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

struct DownloadShareButtonView: View {
    var viewModel: DownloadShareButtonViewModel
    var fileItem: Any
    
    init(fileItem: Any) {
        self.fileItem = fileItem
        viewModel = DownloadShareButtonViewModel(fileItem)
    }
    
    var body: some View {
        HStack {
            // Download Menu
            Button {
                // Show Finder window
                viewModel.openSaveDialog(fileContent: fileItem)
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
                        item.perform(withItems: [viewModel.generateFile()]) // can be changed depends on the view
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
        DownloadShareButtonView(fileItem: "A")
    }
}
