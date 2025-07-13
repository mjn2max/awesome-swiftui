//
// FoundationsTabViewModel.swift
// awesome-swiftui
//
// Created by Huy D. on 7/10/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

class FoundationsViewModel: ObservableObject {
    @Published var searchText: String = .init()

    let foundationList: [FoundationItem] = [
        // Foundations
        .init(data: FoundationApple.accessibility, section: .apple),
        .init(data: FoundationApple.animation, section: .apple),
        .init(data: FoundationApple.color, section: .apple),
        .init(data: FoundationApple.effect, section: .apple),
        .init(data: FoundationApple.environment, section: .apple),
        .init(data: FoundationApple.gesture, section: .apple),
        .init(data: FoundationApple.haptic, section: .apple),
        .init(data: FoundationApple.iconography, section: .apple),
        .init(data: FoundationApple.material, section: .apple),
        .init(data: FoundationApple.typography, section: .apple),
        .init(data: FoundationApple.userInput, section: .apple),
    ]
}

