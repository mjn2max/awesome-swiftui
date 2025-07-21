//
// FoundationsTabView.swift
// awesome-swiftui
//
// Created by Huy D. on 10/31/24
// mjn2max.github.io 😜
// 
// Copyright © 2024. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct FoundationsTabView: View {
    @ObservedObject private var viewModel: FoundationsViewModel = .init()

    var body: some View {
        NavigationStack {
            List {
                ForEach(FoundationSection.allCases, id: \.self) { section in
                    Section(section.title) {
                        let items = viewModel.foundationList.filter { $0.section == section }
                        ForEach(items) { item in
                            NavigationLink(value: item) {
                                CellView(icon: item.data.sfSymbol, title: item.data.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Constants.foundationsTitle)
            .navigationDestination(for: FoundationItem.self) { item in
                BaseWrapperView(for: item.data)
            }
        }
    }
}

#Preview(ColorScheme.light.previewTitle) {
    FoundationsTabView()
}

#Preview(ColorScheme.dark.previewTitle) {
    FoundationsTabView()
        .preferredColorScheme(.dark)
}
