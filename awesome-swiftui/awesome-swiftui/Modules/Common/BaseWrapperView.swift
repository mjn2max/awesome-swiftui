//
// BaseWrapperView.swift
// awesome-swiftui
//
// Created by Huy D. on 6/29/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

protocol ItemProtocol {
    var title: String { get }
    var sfSymbol: String { get }

    associatedtype Content: View
    @ViewBuilder var contentView: Content { get }
}

struct BaseWrapperView: View {
    var itemData: any ItemProtocol

    init(for itemData: any ItemProtocol) {
        self.itemData = itemData
    }

    var body: some View {
        AnyView(itemData.contentView)
    }
}
