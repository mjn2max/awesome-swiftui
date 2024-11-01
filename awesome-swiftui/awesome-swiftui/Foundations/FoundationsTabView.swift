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
    var body: some View {
        Text("FoundationsTabView")
    }
}

#Preview(ColorScheme.light.previewTitle) {
    FoundationsTabView()
}

#Preview(ColorScheme.dark.previewTitle) {
    FoundationsTabView()
        .preferredColorScheme(.dark)
}
