//
// ComponentsTabModel.swift
// awesome-swiftui
//
// Created by Huy D. on 6/27/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import Foundation

enum ComponentsSection: CaseIterable {
    case controls, elements, layoutFundamentals, otherLayouts, lists, structure, modelPresentations, otherTechnologies

    var title: String {
        switch self {
        case .controls: return "Controls"
        case .elements: return "Elements"
        case .layoutFundamentals: return "Layout Fundamentals"
        case .otherLayouts: return "Other Layouts"
        case .lists: return "Lists"
        case .structure: return "Structure"
        case .modelPresentations: return "Model Presentations"
        case .otherTechnologies: return "Other Technologies"
        }
    }
}

struct ComponentItem: Identifiable, Hashable, Equatable {
    let id: UUID = .init()
    let data: any ItemProtocol
    let section: ComponentsSection

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: ComponentItem, rhs: ComponentItem) -> Bool {
        lhs.id == rhs.id
    }
}
