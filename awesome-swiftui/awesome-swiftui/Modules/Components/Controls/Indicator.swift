//
// Indicator.swift
// awesome-swiftui
//
// Created by Huy D. on 8/9/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct Indicator: View {
    private let columns = [GridItem(.adaptive(minimum: 140), spacing: 16, alignment: .top)]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ItemCard(title: "Default ProgressView (Indeterminate)") {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 40, height: 40)
                }

                ItemCard(title: "Circular Spinning Custom Shape") {
                    SpinningCircleIndicator()
                        .frame(width: 40, height: 40)
                }

                ItemCard(title: "Pulsing Dots Animation") {
                    PulsingDotsIndicator()
                        .frame(width: 60, height: 20)
                }

                ItemCard(title: "Bar Progress Animation") {
                    BarProgressIndicator()
                        .frame(width: 80, height: 8)
                }

                ItemCard(title: "Rotating Line Segments Indicator") {
                    RotatingSegmentsIndicator()
                        .frame(width: 40, height: 40)
                }

                ItemCard(title: "Scaling Circle Wave Indicator") {
                    ScalingWaveIndicator()
                        .frame(width: 50, height: 50)
                }

                ItemCard(title: "Gradient Ring Rotation") {
                    GradientRingIndicator()
                        .frame(width: 44, height: 44)
                }

                ItemCard(title: "Bouncing Dots Indicator") {
                    BouncingDotsIndicator()
                        .frame(width: 60, height: 20)
                }

                ItemCard(title: "Dashed Ring Spin") {
                    DashedRingIndicator()
                        .frame(width: 44, height: 44)
                }

                ItemCard(title: "Ripple Expanding Circles") {
                    RippleIndicator()
                        .frame(width: 60, height: 60)
                }
            }
            .padding()
        }
    }
}

// MARK: - Grid Card

private struct ItemCard<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content
    private let cardHeight: CGFloat = 160

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.85)

            Spacer(minLength: 0)

            content
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)

            Spacer(minLength: 0)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .top)
        .frame(height: cardHeight)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.secondary.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.secondary.opacity(0.12))
        )
        .contentShape(Rectangle())
    }
}

// MARK: - Custom Indicators

private struct SpinningCircleIndicator: View {
    @State private var isAnimating = false
    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    isAnimating = true
                }
            }
    }
}

private struct PulsingDotsIndicator: View {
    @State private var scale: [CGFloat] = [1, 1, 1]
    let animation = Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { i in
                Circle()
                    .frame(width: 12, height: 12)
                    .scaleEffect(scale[i])
                    .foregroundColor(.accentColor)
            }
        }
        .onAppear {
            for i in 0..<3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.18) {
                    withAnimation(animation) {
                        scale[i] = 0.5
                    }
                }
            }
        }
    }
}

private struct BarProgressIndicator: View {
    @State private var progress: CGFloat = 0
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                Capsule()
                    .fill(Color.accentColor)
                    .frame(width: geo.size.width * progress)
            }
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                progress = 1
            }
        }
    }
}

private struct RotatingSegmentsIndicator: View {
    @State private var rotation: Double = 0
    let segments: Int = 12
    var body: some View {
        ZStack {
            ForEach(0..<segments, id: \.self) { i in
                Capsule()
                    .fill(Color.accentColor.opacity(Double(i+1)/Double(segments)))
                    .frame(width: 4, height: 12)
                    .offset(y: -14)
                    .rotationEffect(.degrees(Double(i) * (360.0/Double(segments))))
            }
        }
        .rotationEffect(.degrees(rotation))
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

private struct ScalingWaveIndicator: View {
    @State private var scale: CGFloat = 1
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.accentColor.opacity(0.3), lineWidth: 4)
                .scaleEffect(scale)
            Circle()
                .fill(Color.accentColor)
                .frame(width: 14, height: 14)
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false)) {
                scale = 2
            }
        }
    }
}

private struct GradientRingIndicator: View {
    @State private var rotation: Double = 0
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.8)
            .stroke(
                AngularGradient(
                    gradient: Gradient(colors: [.accentColor, .accentColor.opacity(0.1), .accentColor]),
                    center: .center),
                style: StrokeStyle(lineWidth: 4, lineCap: .round)
            )
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}

private struct BouncingDotsIndicator: View {
    @State private var offset: [CGFloat] = [0, 0, 0]
    let animation = Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { i in
                Circle()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.accentColor)
                    .offset(y: offset[i])
            }
        }
        .onAppear {
            for i in 0..<3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.13) {
                    withAnimation(animation) {
                        offset[i] = -10
                    }
                }
            }
        }
    }
}

private struct DashedRingIndicator: View {
    @State private var rotation: Double = 0
    var body: some View {
        Circle()
            .trim(from: 0, to: 1)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [6, 6]))
            .foregroundStyle(Color.accentColor)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
            }
    }
}

private struct RippleIndicator: View {
    @State private var scale1: CGFloat = 0.2
    @State private var opacity1: CGFloat = 1
    @State private var scale2: CGFloat = 0.2
    @State private var opacity2: CGFloat = 1

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.accentColor.opacity(0.5), lineWidth: 3)
                .scaleEffect(scale1)
                .opacity(opacity1)
            Circle()
                .stroke(Color.accentColor.opacity(0.35), lineWidth: 3)
                .scaleEffect(scale2)
                .opacity(opacity2)
            Circle()
                .fill(Color.accentColor)
                .frame(width: 10, height: 10)
        }
        .onAppear {
            let base = Animation.easeOut(duration: 1.4).repeatForever(autoreverses: false)
            withAnimation(base) {
                scale1 = 1.2
                opacity1 = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                withAnimation(base) {
                    scale2 = 1.2
                    opacity2 = 0
                }
            }
        }
    }
}
#Preview {
    NavigationStack {
        Indicator()
            .navigationTitle("Indicators")
            .frame(height: 600)
    }
}
