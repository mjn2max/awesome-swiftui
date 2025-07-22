//
// Foundations+CustomizationsModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/13/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum FoundationCustomization: ItemProtocol {
    case background, demo1, demo2, demo3, demo4
    
    var title: String {
        switch self {
        case .background: return "Background"
        case .demo1: return "Demo 1"
        case .demo2: return "Demo 2"
        case .demo3: return "Demo 3"
        case .demo4: return "Demo 4"
        }
    }
    
    var sfSymbol: String {
        switch self {
        case .background: return "photo.tv"
        case .demo1: return "lasso.badge.sparkles"
        case .demo2: return "lasso.badge.sparkles"
        case .demo3: return "lasso.badge.sparkles"
        case .demo4: return "lasso.badge.sparkles"
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
