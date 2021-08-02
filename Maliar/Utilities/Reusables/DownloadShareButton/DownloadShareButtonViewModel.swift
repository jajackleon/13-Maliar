//
//  DownloadShareButtonViewModel.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

class DownloadShareButtonViewModel: ObservableObject {
    @Published var sharingMenu: [NSSharingService] = [
        NSSharingService(title: "Save as ", image: NSImage(systemSymbolName: "arrow.down.circle", accessibilityDescription: nil)!, alternateImage: nil) {
            print("Clicked!")
        }
    ]
    
    // what should we perform when there is an image or 
}
