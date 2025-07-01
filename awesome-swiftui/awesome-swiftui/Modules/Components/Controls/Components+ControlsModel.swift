//
// Components+ControlsModel.swift
// awesome-swiftui
//
// Created by Huy D. on 6/30/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentControl: ItemProtocol {
    case buttonLink, menu, valueInput, picker, indicator

    var title: String {
        switch self {
        case .buttonLink: return "Buttons & Links"
        case .menu: return "Menu"
        case .valueInput: return "Value Inputs"
        case .picker: return "Pickers"
        case .indicator: return "Indicators"
        }
    }

    var sfSymbol: String {
        switch self {
        case .buttonLink: return "button.horizontal"
        case .menu: return "filemenu.and.selection"
        case .valueInput: return "switch.2"
        case .picker: return "calendar"
        case .indicator: return "gauge.with.dots.needle.67percent"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
