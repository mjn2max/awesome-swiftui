//
// Foundations+AppleModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/9/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum FoundationApple: ItemProtocol {
    case accessibility, animation, color, effect, environment, gesture, haptic, iconography, material, typography, userInput

    var title: String {
        switch self {
        case .accessibility: return "Accessibility"
        case .animation: return "Animation"
        case .color: return "Colors"
        case .effect: return "Effects"
        case .environment: return "Environment"
        case .gesture: return "Gestures"
        case .haptic: return "Haptics"
        case .iconography: return "Iconography"
        case .material: return "Materials"
        case .typography: return "Typography"
        case .userInput: return "User Input"
        }
    }

    var sfSymbol: String {
        switch self {
        case .accessibility: return "figure.stand"
        case .animation: return "square.stack.3d.forward.dottedline"
        case .color: return "paintpalette"
        case .effect: return "wand.and.rays"
        case .environment: return "apple.terminal"
        case .gesture: return "hand.draw"
        case .haptic: return "waveform"
        case .iconography: return "heart"
        case .material: return "square.stack.3d.up"
        case .typography: return "textformat.alt"
        case .userInput: return "character.cursor.ibeam"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
