//
// ComponentsTabView.swift
// awesome-swiftui
//
// Created by Huy D. on 10/31/24
// mjn2max.github.io 😜
//
// Copyright © 2024. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct ComponentsTabView: View {
    @ObservedObject private var viewModel: ComponentsViewModel = .init()

    var body: some View {
        NavigationStack {
            List {
                ForEach(ComponentsSection.allCases, id: \.self) { section in
                    Section(section.title) {
                        let items = viewModel.componentList.filter { $0.section == section }
                        ForEach(items) { item in
                            NavigationLink(value: item) {
                                CellView(icon: item.data.sfSymbol, title: item.data.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Constants.componentsTitle)
            .navigationDestination(for: ComponentItem.self) { item in
                BaseWrapperView(for: item.data)
            }
        }
        .searchable(text: $viewModel.searchText)
    }
}

#Preview(ColorScheme.light.previewTitle) {
    ComponentsTabView()
}

#Preview(ColorScheme.dark.previewTitle) {
    ComponentsTabView()
        .preferredColorScheme(.dark)
}
