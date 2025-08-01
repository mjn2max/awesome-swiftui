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
    @ObservedObject private var viewModel: SettingsViewModel = .init()

    var body: some View {
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
                                    CellView(icon: item.data.sfSymbol, title: item.data.title, detailText: "Demo")
                                }
                            default:
                                NavigationLink(value: item) {
                                    CellView(icon: item.data.sfSymbol, title: item.data.title, detailText: "Demo")
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
}

fileprivate struct General_ColorSchemeView: View {
    let sfSymbol: String
    let titleText: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: sfSymbol)
                .font(.body)
                .frame(width: 24, height: 24)
                .foregroundStyle(Color.accentColor)

            Text(titleText)

            Spacer(minLength: 8)
//            Picker("", selection: $themeManager.colorScheme) {
//                ForEach(General_ColorSchemeModel.allCases, id: \.self) {
//                    Text($0.title)
//                        .tag($0.rawValue)
//                        .font(.callout)
//                        .foregroundStyle(.gray)
//                }
//
//            }
//            .pickerStyle(.navigationLink)
//            .padding(.vertical, -12)
        }
    }
}

#Preview {
    SettingsTabView()
}
