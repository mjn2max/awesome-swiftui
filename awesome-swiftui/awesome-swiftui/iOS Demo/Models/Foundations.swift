//
// Foundations.swift
// awesome-swiftui
//
// Created by Huy D. on 9/10/24
// mjn2max.github.io 😜
// 
// Copyright © 2024. All rights reserved.
// mjn2max.com
//

enum FoundationItem {
    case accessibility
    case animation
    case colors
    case effects
    case environment
    case gesture
    case haptics
    case iconography
    case materials
    case typography
    case userInput

    var title: String {
        switch self {
        case .accessibility:
            return "Accessibility"
        case .animation:
            return "Animation"
        case .colors:
            return "Colors"
        case .effects:
            return "Effects"
        case .environment:
            return "Environment"
        case .gesture:
            return "Gesture"
        case .haptics:
            return "Haptics"
        case .iconography:
            return "Iconography"
        case .materials:
            return "Materials"
        case .typography:
            return "Typography"
        case .userInput:
            return "User Input"
        }
    }

    var iconName: String {
        switch self {
        case .accessibility:
            return ""
        case .animation:
            return ""
        case .colors:
            return ""
        case .effects:
            return ""
        case .environment:
            return ""
        case .gesture:
            return ""
        case .haptics:
            return ""
        case .iconography:
            return ""
        case .materials:
            return ""
        case .typography:
            return ""
        case .userInput:
            return ""
        }
    }
}
