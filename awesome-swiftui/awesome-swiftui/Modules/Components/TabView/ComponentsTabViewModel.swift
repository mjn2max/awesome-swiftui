//
// ComponentsTabViewModel.swift
// awesome-swiftui
//
// Created by Huy D. on 6/29/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import Foundation

class ComponentsViewModel: ObservableObject {
    @Published var searchText: String = .init()

    let componentList: [ComponentItem] = [
        // Controls
        .init(data: ComponentControl.buttonLink , section: .controls),
        .init(data: ComponentControl.menu, section: .controls),
        .init(data: ComponentControl.valueInput, section: .controls),
        .init(data: ComponentControl.picker, section: .controls),
        .init(data: ComponentControl.indicator, section: .controls),

        // Elements
        .init(data: ComponentElement.image, section: .elements),
        .init(data: ComponentElement.shape, section: .elements),
        .init(data: ComponentElement.text, section: .elements),
        .init(data: ComponentElement.textField, section: .elements),

        // Layout Fundamentals
        .init(data: ComponentLayoutFundamental.stack, section: .layoutFundamentals),
        .init(data: ComponentLayoutFundamental.grid, section: .layoutFundamentals),
        .init(data: ComponentLayoutFundamental.separator, section: .layoutFundamentals),
        .init(data: ComponentLayoutFundamental.backgroundOverlay, section: .layoutFundamentals),
        .init(data: ComponentLayoutFundamental.viewThatFits, section: .layoutFundamentals),
        .init(data: ComponentLayoutFundamental.zIndex, section: .layoutFundamentals),

        // Other Layouts
        .init(data: ComponentOtherLayout.table, section: .otherLayouts),
        .init(data: ComponentOtherLayout.group, section: .otherLayouts),
        .init(data: ComponentOtherLayout.scrollView, section: .otherLayouts),
        .init(data: ComponentOtherLayout.frame, section: .otherLayouts),
        .init(data: ComponentOtherLayout.containerRelativeFrame, section: .otherLayouts),
        .init(data: ComponentOtherLayout.safeAreaInsets, section: .otherLayouts),

        // Lists
        .init(data: ComponentList.list, section: .lists),
        .init(data: ComponentList.disclosureGroup, section: .lists),
        .init(data: ComponentList.outlineGroup, section: .lists),

        // Structure
        .init(data: ComponentStructure.tabView, section: .structure),
        // .init(data: ComponentStructure.splitView, section: .structure),
        .init(data: ComponentStructure.navigationStack, section: .structure),
        .init(data: ComponentStructure.navigationSplitView, section: .structure),
        .init(data: ComponentStructure.search, section: .structure),
        .init(data: ComponentStructure.toolbars, section: .structure),
        // .init(data: ComponentStructure.windowGroup, section: .structure),
    ]
}
