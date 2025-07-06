//
// Components+OtherLayoutsModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/6/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentOtherLayout: ItemProtocol {
    case table, group, scrollView, frame, containerRelativeFrame, safeAreaInsets

    var title: String {
        switch self {
        case .table: return "Table"
        case .group: return "Groups"
        case .scrollView: return "Scroll View"
        case .frame: return "Frame"
        case .containerRelativeFrame: return "Container Relative Frame"
        case .safeAreaInsets: return "Safe Area Insets"
        }
    }

    var sfSymbol: String {
        switch self {
        case .table: return "tablecells"
        case .group: return "square.on.square.squareshape.controlhandles"
        case .scrollView: return "arrow.up.arrow.down"
        case .frame: return "square"
        case .containerRelativeFrame: return "appwindow.swipe.rectangle"
        case .safeAreaInsets: return "inset.filled.bottomthird.rectangle.portrait"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}

