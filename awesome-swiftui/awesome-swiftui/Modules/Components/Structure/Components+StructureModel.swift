//
// Components+StructureModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/6/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentStructure: ItemProtocol {
    case tabView, navigationStack, navigationSplitView, search, toolbars
#if os(macOS)
    case splitView, windowGroup
#endif

    var title: String {
        switch self {
        case .tabView: return "Tab View"
        case .navigationStack: return "Navigation Stack"
        case .navigationSplitView: return "Navigation Split View"
        case .search: return "Search"
        case .toolbars: return "Toolbars"
#if os(macOS)
        case .splitView: return "Split View"
        case .windowGroup: return "Window Group"
#endif
        }
    }

    var sfSymbol: String {
        switch self {
        case .tabView: return "squares.below.rectangle"
        case .navigationStack: return "square.stack.3d.down.right"
        case .navigationSplitView: return "sidebar.squares.left"
        case .search: return "magnifyingglass"
        case .toolbars: return "menubar.rectangle"
#if os(macOS)
        case .splitView: return "rectangle.portrait.split.2x1"
        case .windowGroup: return "macwindow.on.rectangle"
#endif
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        switch self {
        case .tabView: EmptyView()
        case .navigationStack: EmptyView()
        case .navigationSplitView: EmptyView()
        case .search: EmptyView()
        case .toolbars: EmptyView()
#if os(macOS)
        case .splitView: EmptyView()
        case .windowGroup: EmptyView()
#endif
        }
    }
}
