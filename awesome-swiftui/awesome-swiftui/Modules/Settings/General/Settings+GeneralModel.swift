//
// Settings+GeneralModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/27/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum SettingGeneral: ItemProtocol {
    case colorScheme, accentColor, fontSize, layoutDirection, background, appIcon, documentation

    var title: String {
        switch self {
        case .colorScheme: return "Color Scheme"
        case .accentColor: return "Accent Color"
        case .fontSize: return "Font Size"
        case .layoutDirection: return "Layout Direction"
        case .background: return "Background"
        case .appIcon: return "App Icon"
        case .documentation: return "Documentation"
        }
    }

    var sfSymbol: String {
        switch self {
        case .colorScheme: return "circle.righthalf.filled"
        case .accentColor: return "paintbrush.pointed"
        case .fontSize: return "textformat.size"
        case .layoutDirection: return "arrow.left.arrow.right"
        case .background: return "photo"
        case .appIcon: return "square"
        case .documentation: return "document"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
