//
// CellView.swift
// awesome-swiftui
//
// Created by Huy D. on 6/26/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct CellView: View {
    let icon: String
    let title: String
    let detailText: String?

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.body)
                .frame(width: 24, height: 24)
                .foregroundColor(.red)

            Text(title)

            if let detailText, !detailText.isEmpty {
                Spacer(minLength: 8)
                Text(detailText)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
        }
    }
}
