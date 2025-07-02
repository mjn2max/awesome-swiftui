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
        Text("ComponentsTabView")
    }
}

#Preview(ColorScheme.light.previewTitle) {
    ComponentsTabView()
}

#Preview(ColorScheme.dark.previewTitle) {
    ComponentsTabView()
        .preferredColorScheme(.dark)
}
