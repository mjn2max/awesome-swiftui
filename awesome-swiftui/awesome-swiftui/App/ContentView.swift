//
// ContentView.swift
// awesome-swiftui
//
// Created by Huy D. on 1/5/23
// mjn2max.github.io 😜
//
// Copyright © 2023. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ComponentsTabView()
                .tabItem {
                    Label(Constants.componentsTitle, systemImage: "cube.fill")
                }

            FoundationsTabView()
                .tabItem {
                    Label(Constants.foundationsTitle, systemImage: "square.stack.3d.up")
                }

            SettingsTabView()
                .tabItem {
                    Label(Constants.settingsTitle, systemImage: "gear")
                }
        }
    }
}

#Preview(ColorScheme.light.previewTitle) {
    ContentView()
}

#Preview(ColorScheme.dark.previewTitle) {
    ContentView()
        .preferredColorScheme(.dark)
}
