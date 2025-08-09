//
// Components+OtherTechnologiesModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/8/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentOtherTechnology: ItemProtocol {
    case chart, map, tip, media, privacyApplePay

    var title: String {
        switch self {
        case .chart: return "Chart"
        case .map: return "Map"
        case .tip: return "Tip"
        case .media: return "Media"
        case .privacyApplePay: return "Privacy & Apple Pay"
        }
    }

    var sfSymbol: String {
        switch self {
        case .chart: return "chart.line.uptrend.xyaxis"
        case .map: return "map"
        case .tip: return "questionmark.circle"
        case .media: return "play.rectangle"
        case .privacyApplePay: return "apple.logo"
        }
    }

    @ViewBuilder
    var contentView: some View {
        switch self {
        case .chart:
            Charts()
        default:
            // TODO: Add detail views
            EmptyView()
        }
    }
}
