//
// Components+ModelPresentationsModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/7/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

enum ComponentModelPresentation: ItemProtocol {
    case alert, confirmationDialog, notification, sheet, inspector, popover
    
    var title: String {
        switch self {
        case .alert: return "Alert"
        case .confirmationDialog: return "Confirmation Dialog"
        case .notification: return "Notification"
        case .sheet: return "Sheet"
        case .inspector: return "Inspector"
        case .popover: return "Popover"
        }
    }
    
    var sfSymbol: String {
        switch self {
        case .alert: return "note.text"
        case .confirmationDialog: return "app.badge.checkmark"
        case .notification: return "bell"
        case .sheet: return "square.stack"
        case .inspector: return "sidebar.squares.trailing"
        case .popover: return "bubble"
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        // TODO: Add detail views
        EmptyView()
    }
}
