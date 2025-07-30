//
// SettingsTabView.swift
// awesome-swiftui
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct SettingsTabView: View {
    NavigationStack {
        List {
            ForEach(SettingSection.allCases, id: \.self) { section in
                Section(section.title) {
                    let items = viewModel.settingList.filter { $0.section == section }
                    ForEach(items) { item in
                        switch item.data {
                        case SettingGeneral.colorScheme:
                            General_ColorSchemeView(sfSymbol: item.data.sfSymbol, titleText: item.data.title)
                        case SettingGeneral.accentColor:
                            NavigationLink(value: item) {
                                ItemRowView(sfSymbol: item.data.sfSymbol, titleText: item.data.title, infoText: themeManager.accentColor.toHex())
                            }
                        default:
                            NavigationLink(value: item) {
                                ItemRowView(sfSymbol: item.data.sfSymbol, titleText: item.data.title, infoText: "Demo")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(Constants.settingsTitle)
        .navigationDestination(for: SettingItem.self) { item in
            BaseWrapperView(for: item.data)
        }
    }
}

#Preview {
    SettingsTabView()
}
