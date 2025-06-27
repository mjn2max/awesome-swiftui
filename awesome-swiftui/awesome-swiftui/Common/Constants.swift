//
// Constants.swift
// awesome-swiftui
//
// Created by Huy D. on 10/31/24
// mjn2max.github.io 😜
//
// Copyright © 2024. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct Constants {
    static let componentsTitle: String = "Components"
    static let foundationsTitle: String = "Foundations"
    static let settingsTitle: String = "Settings"
}

extension ColorScheme {
    var previewTitle: String {
        switch self {
        case .light: return "Light"
        case .dark: return "Dark"
        @unknown default: return "Unknown"
        }
    }
}
