//
// OtherApps+GeneralModel.swift
// awesome-swiftui
//
// Created by Huy D. on 8/2/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum SettingOtherApps: ItemProtocol {
    case app1, app2, app3, app4, app5

    var title: String {
        switch self {
        case .app1: return "App 1"
        case .app2: return "App 2"
        case .app3: return "App 3"
        case .app4: return "App 4"
        case .app5: return "App 5"
        }
    }

    var sfSymbol: String {
        switch self {
        case .app1: return "square.and.arrow.down"
        case .app2: return "square.and.arrow.down"
        case .app3: return "square.and.arrow.down"
        case .app4: return "square.and.arrow.down"
        case .app5: return "square.and.arrow.down"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()

    }
}
