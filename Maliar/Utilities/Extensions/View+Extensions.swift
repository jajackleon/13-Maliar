//
//  View+Extensions.swift
//  Maliar
//
//  Created by Nicholas on 02/08/21.
//

import SwiftUI

extension View {
    func saveAsImage(width: CGFloat, height: CGFloat, _ completion: @escaping (NSImage) -> Void) {
//        let size = CGSize(width: width, height: height)
        
        let nsView = NSHostingView(rootView: self)
        guard let bitmapRep = nsView.bitmapImageRepForCachingDisplay(in: nsView.bounds) else { return }
        bitmapRep.size = nsView.bounds.size
        nsView.cacheDisplay(in: nsView.bounds, to: bitmapRep)
//        let data = bitmapRep.representation(using: .png, properties: [:])
    }
    
    func snapshot() -> NSImage {
        let view = NSHostingView(rootView: self)

        let targetSize = view.intrinsicContentSize
        view.bounds = CGRect(origin: .zero, size: targetSize)

        return view.asImage()
//        let renderer = UIGraphicsImageRenderer(size: targetSize)
//
//        return renderer.image { _ in
//            view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
    }
    
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
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
