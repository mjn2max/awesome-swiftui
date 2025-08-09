//
// Components+LayoutFundamentalsModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/3/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentLayoutFundamental: ItemProtocol {
    case stack, grid, separator, backgroundOverlay, viewThatFits, zIndex

    var title: String {
        switch self {
        case .stack: return "Stack"
        case .grid: return "Grid"
        case .separator: return "Separators"
        case .backgroundOverlay: return "Background & Overlay"
        case .viewThatFits: return "View That Fits"
        case .zIndex: return "Z Index"
        }
    }

    var sfSymbol: String {
        switch self {
        case .stack: return "square.stack.3d.up"
        case .grid: return "square.grid.3x3"
        case .separator: return "rectangle.dashed"
        case .backgroundOverlay: return "square.on.square.dashed"
        case .viewThatFits: return "square.resize"
        case .zIndex: return "square.2.layers.3d"
        }
    }

    @ViewBuilder
    var contentView: some View {
        switch self {
        case .separator:
            Separators()
        default:
            // TODO: Add detail views
            EmptyView()
        }
    }
}
