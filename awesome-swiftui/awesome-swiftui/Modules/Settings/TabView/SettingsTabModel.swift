//
// SettingsTabModel.swift
// awesome-swiftui
//
// Created by Huy D. on 6/29/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import Foundation

enum SettingSection: CaseIterable {
    case general, about, otherApps

    var title: String {
        switch self {
        case .general: return "General"
        case .about: return "About"
        case .otherApps: return "Other Apps"
        }
    }
}
