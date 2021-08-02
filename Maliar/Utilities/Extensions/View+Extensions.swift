//
//  View+Extensions.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

extension View {
    func saveAsImage(width: CGFloat, height: CGFloat, _ completion: @escaping (NSImage) -> Void) {
        let size = CGSize(width: width, height: height)
        
        let controller = NSHostingController(rootView: self.frame(width: width, height: height))
        controller.view.bounds = CGRect(origin: .zero, size: size)
        let image = controller.view.asImage()
        
        completion(image)
    }
}

extension NSView {
    func asImage() -> NSImage {
        guard let bitmapRep = bitmapImageRepForCachingDisplay(in: bounds) else { return NSImage() }
        cacheDisplay(in: bounds, to: bitmapRep)
        let image = NSImage()
        image.addRepresentation(bitmapRep)
        bitmapRep.size = bounds.size
        return image
    }
}
