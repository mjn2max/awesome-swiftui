//
// SettingsTabViewModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/22/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import Foundation

class SettingsViewModel: ObservableObject {
    let settingList: [SettingItem] = [
        // General
        .init(data: SettingGeneral.colorScheme, section: .general),
        .init(data: SettingGeneral.accentColor, section: .general),
        .init(data: SettingGeneral.fontSize, section: .general),
        .init(data: SettingGeneral.layoutDirection, section: .general),
        .init(data: SettingGeneral.background, section: .general),
        .init(data: SettingGeneral.appIcon, section: .general),
        .init(data: SettingGeneral.documentation, section: .general),

        // About
        .init(data: SettingAbout.acknowledgement, section: .about),
        .init(data: SettingAbout.tipJar, section: .about),
        .init(data: SettingAbout.shareApp, section: .about),
        .init(data: SettingAbout.contact, section: .about),
        .init(data: SettingAbout.rateOnAppStore, section: .about),
        .init(data: SettingAbout.appVersion, section: .about),
    ]
}
