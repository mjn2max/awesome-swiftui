//
// ButtonsLinks.swift
// awesome-swiftui
//
// Created by Huy D. on 8/9/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct ButtonsLinks: View {
    var body: some View {
        VStack(spacing: 20) {
            PrimaryGradientButton(title: "Get Started") {
                print("PrimaryGradientButton tapped")
            }
            IconCapsuleButton(title: "Settings", systemImage: "gear") {
                print("IconCapsuleButton tapped")
            }
            AnimatedPressButton(title: "Tap Me") {
                print("AnimatedPressButton tapped")
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

fileprivate struct PrimaryGradientButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                        .cornerRadius(12)
                )
                .foregroundColor(.white)
                .shadow(radius: 4)
        }
        .buttonStyle(.plain)
    }
}

fileprivate struct IconCapsuleButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(Color.blue.opacity(0.15))
            .foregroundColor(.blue)
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

fileprivate struct AnimatedPressButton: View {
    var title: String
    var action: () -> Void
    @State private var pressed = false

    var body: some View {
        Button(action: {
            withAnimation(.easeOut(duration: 0.2)) {
                pressed = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.spring()) {
                    pressed = false
                }
                action()
            }
        }) {
            Text(title)
                .padding(.vertical, 12)
                .padding(.horizontal, 20)
                .background(Color.orange)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(pressed ? 0.92 : 1)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ButtonsLinks()
}
