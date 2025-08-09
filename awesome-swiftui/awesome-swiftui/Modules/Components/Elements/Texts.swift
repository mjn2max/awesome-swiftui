//
// Texts.swift
// awesome-swiftui
//
// Created by Huy D. on 8/9/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct Texts: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                VStack {
                    Text("Large title with bold")
                        .font(.largeTitle)
                        .bold()
                    Text("This is a large title bold text")
                        .font(.largeTitle)
                        .bold()
                }

                VStack {
                    Text("Headline with italic")
                        .font(.headline)
                        .italic()
                    Text("This is a headline italic text")
                        .font(.headline)
                        .italic()
                }

                VStack {
                    Text("Monospaced font")
                    Text("Monospaced Text Example")
                        .font(.system(.body, design: .monospaced))
                }

                VStack {
                    Text("Custom font with color")
                    Text("Custom Font Colored")
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.purple)
                }

                VStack {
                    Text("Gradient text using overlay + mask")
                    Text("Gradient Text")
                        .font(.title)
                        .bold()
                        .overlay(
                            LinearGradient(
                                colors: [.red, .orange, .yellow, .green, .blue, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .mask(
                                Text("Gradient Text")
                                    .font(.title)
                                    .bold()
                            )
                        )
                }

                VStack {
                    Text("Background highlight")
                    Text("Highlighted Text")
                        .font(.title2)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.yellow.opacity(0.6))
                        )
                }

                VStack {
                    Text("Blurred text")
                    Text("Blurred Text Example")
                        .font(.title2)
                        .blur(radius: 3)
                }

                VStack {
                    Text("Rotated text")
                    Text("Rotated Text Example")
                        .font(.title2)
                        .rotationEffect(.degrees(-15))
                }

                VStack {
                    Text("Scaled text")
                    Text("Scaled Text Example")
                        .font(.title2)
                        .scaleEffect(1.5)
                }

                VStack {
                    Text("3D rotation")
                    Text("3D Rotated Text")
                        .font(.title2)
                        .rotation3DEffect(
                            .degrees(45),
                            axis: (x: 1, y: 0, z: 0)
                        )
                }

                VStack {
                    Text("Underlined and strikethrough")
                    Text("Underlined & Strikethrough")
                        .underline()
                        .strikethrough()
                }

                VStack {
                    Text("Multiline centered text")
                    Text("This is a long text that spans multiple lines to demonstrate multiline text alignment in SwiftUI.")
                        .multilineTextAlignment(.center)
                        .padding()
                }

                VStack {
                    Text("Kerning and tracking example")
                    Text("Kerning and Tracking")
                        .kerning(5)
                        .tracking(5)
                }

                VStack {
                    Text("Shadowed text")
                    Text("Shadow Text")
                        .font(.title)
                        .shadow(color: .gray, radius: 2, x: 2, y: 2)
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        Texts()
            .frame(height: 600)
    }
}
