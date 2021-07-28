//
//  SidebarMenu.swift
//  Maliar
//
//  Created by Nicholas on 28/07/21.
//

import Foundation
import SwiftUI

enum SidebarMenu: String, CaseIterable {
    case trends = "Trends"
    case cases = "Cases"
    
    func getImage() -> Image {
        switch self {
        case .trends:
            return Image(systemName: "flame")
        case .cases:
            return Image(systemName: "doc")
        }
        return Image(systemName: "x.square")
    }
    
    @ViewBuilder func getContainingView() -> some View {
        switch self {
        case .trends:
            TrendsView()
        case .cases:
            CasesView()
        }
    }
}
