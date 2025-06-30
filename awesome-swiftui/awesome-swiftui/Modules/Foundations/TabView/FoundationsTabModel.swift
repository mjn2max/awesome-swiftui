//
// FoundationsTabModel.swift
// awesome-swiftui
//
// Created by Huy D. on 6/29/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import Foundation

enum FoundationSection: CaseIterable {
    case apple, customizations

    var title: String {
        switch self {
        case .apple: return "Apple"
        case .customizations: return "Customizations"
        }
    }
}
