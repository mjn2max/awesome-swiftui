//
// Components+ElementsModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/2/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentElement: ItemProtocol {
    case image, shape, text, textField

    var title: String {
        switch self {
        case .image: return "Images"
        case .shape: return "Shapes"
        case .text: return "Text"
        case .textField: return "TextField"
        }
    }

    var sfSymbol: String {
        switch self {
        case .image: return "photo"
        case .shape: return "square.on.circle"
        case .text: return "text.quote"
        case .textField: return "keyboard.onehanded.left"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
