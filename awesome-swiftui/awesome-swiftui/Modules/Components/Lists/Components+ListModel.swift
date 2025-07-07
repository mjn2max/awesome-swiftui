//
// Components+ListModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/6/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentList: ItemProtocol {
    case list, disclosureGroup, outlineGroup

    var title: String {
        switch self {
        case .list: return "List"
        case .disclosureGroup: return "Disclosure Group"
        case .outlineGroup: return "Outline Group"
        }
    }

    var sfSymbol: String {
        switch self {
        case .list: return "rectangle.grid.1x2"
        case .disclosureGroup: return "chevron.down"
        case .outlineGroup: return "list.bullet.indent"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
