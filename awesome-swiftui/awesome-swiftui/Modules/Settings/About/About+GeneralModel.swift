//
// About+GeneralModel.swift
// awesome-swiftui
//
// Created by Huy D. on 8/2/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum SettingAbout: ItemProtocol {
    case acknowledgement, tipJar, shareApp, contact, rateOnAppStore, appVersion

    var title: String {
        switch self {
        case .acknowledgement: return "Acknowledgement"
        case .tipJar: return "Tip Jar"
        case .shareApp: return "Share App"
        case .contact: return "Contact"
        case .rateOnAppStore: return "Rate on the App Store"
        case .appVersion: return "App Version"
        }
    }

    var sfSymbol: String {
        switch self {
        case .acknowledgement: return "hand.thumbsup"
        case .tipJar: return "hands.clap"
        case .shareApp: return "square.and.arrow.up"
        case .contact: return "envelope"
        case .rateOnAppStore: return "star"
        case .appVersion: return "info.circle"
        }
    }

    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
