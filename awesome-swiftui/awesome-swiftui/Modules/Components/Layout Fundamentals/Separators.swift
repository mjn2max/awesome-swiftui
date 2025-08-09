//
// Separators.swift
// awesome-swiftui
//
// Created by Huy D. on 8/9/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct Separators: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                Group {
                    Text("Default Divider")
                        .font(.headline)
                        .padding(.horizontal)
                    DefaultDividerExample()
                        .padding(.horizontal)

                    Text("Colored Divider")
                        .font(.headline)
                        .padding(.horizontal)
                    ColoredDividerExample()
                        .padding(.horizontal)

                    Text("Thick Divider")
                        .font(.headline)
                        .padding(.horizontal)
                    ThickDividerExample()
                        .padding(.horizontal)

                    Text("Dashed Line Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    DashedLineSeparator()
                        .padding(.horizontal)

                    Text("Gradient Line Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    GradientLineSeparator()
                        .padding(.horizontal)

                    Text("Double Line Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    DoubleLineSeparator()
                        .padding(.horizontal)

                    Text("Dotted Line Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    DottedLineSeparator()
                        .padding(.horizontal)

                    Text("Wavy Line Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    WavyLineSeparator()
                        .padding(.horizontal)

                    // Additional Separators
                    Text("Zigzag Line Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    ZigzagLineSeparator()
                        .padding(.horizontal)

                    Text("Triangle Pattern Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    TrianglePatternSeparator()
                        .padding(.horizontal)

                    Text("Curved Line Separator")
                        .font(.headline)
                        .padding(.horizontal)
                    CurvedLineSeparator()
                        .padding(.horizontal)

                    Text("Icon Divider")
                        .font(.headline)
                        .padding(.horizontal)
                    IconDividerSeparator()
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
    }
}

// MARK: - Separator Examples

private struct DefaultDividerExample: View {
    var body: some View {
        Divider()
    }
}

private struct ColoredDividerExample: View {
    var body: some View {
        Divider()
            .background(Color.accentColor)
    }
}

private struct ThickDividerExample: View {
    var body: some View {
        Divider()
            .frame(height: 4)
            .background(Color.secondary)
    }
}

private struct DashedLineSeparator: View {
    var body: some View {
        Rectangle()
            .fill(Color.secondary)
            .frame(height: 2)
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [8, 6]))
                    .foregroundColor(.secondary)
            )
            .background(Color.clear)
    }
}

private struct GradientLineSeparator: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [Color.purple, Color.blue, Color.green],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(height: 3)
            .cornerRadius(1.5)
    }
}

private struct DoubleLineSeparator: View {
    var body: some View {
        VStack(spacing: 3) {
            Rectangle()
                .fill(Color.secondary)
                .frame(height: 1)
            Rectangle()
                .fill(Color.secondary)
                .frame(height: 1)
        }
    }
}

private struct DottedLineSeparator: View {
    var body: some View {
        GeometryReader { geo in
            let dotCount = Int(geo.size.width / 8)
            HStack(spacing: 4) {
                ForEach(0..<dotCount, id: \.self) { _ in
                    Circle()
                        .frame(width: 3, height: 3)
                        .foregroundColor(.secondary)
                }
            }
            .frame(height: 6, alignment: .center)
        }
        .frame(height: 8)
    }
}

private struct WavyLineSeparator: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                let width = geo.size.width
                let height: CGFloat = geo.size.height
                let amplitude: CGFloat = 6
                let waveLength: CGFloat = 32
                path.move(to: CGPoint(x: 0, y: height / 2))
                var x: CGFloat = 0
                while x <= width {
                    let y = sin(x / waveLength * .pi * 2) * amplitude / 2 + height / 2
                    path.addLine(to: CGPoint(x: x, y: y))
                    x += 1
                }
            }
            .stroke(Color.secondary, lineWidth: 2)
        }
        .frame(height: 14)
    }
}

private struct ZigzagLineSeparator: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                let width = geo.size.width
                let height: CGFloat = geo.size.height
                let zigzagHeight: CGFloat = 10
                let segmentWidth: CGFloat = 12
                var x: CGFloat = 0
                var up = true
                path.move(to: CGPoint(x: 0, y: height / 2))
                while x < width {
                    let nextX = min(x + segmentWidth, width)
                    let y = up ? (height / 2 - zigzagHeight/2) : (height / 2 + zigzagHeight/2)
                    path.addLine(to: CGPoint(x: nextX, y: y))
                    x = nextX
                    up.toggle()
                }
            }
            .stroke(Color.secondary, lineWidth: 2)
        }
        .frame(height: 16)
    }
}

private struct TrianglePatternSeparator: View {
    var body: some View {
        GeometryReader { geo in
            let triangleWidth: CGFloat = 12
            let triangleHeight: CGFloat = 8
            let count = Int(geo.size.width / triangleWidth)
            HStack(spacing: 0) {
                ForEach(0..<count, id: \.self) { _ in
                    TriangleUp()
                        .fill(Color.secondary)
                        .frame(width: triangleWidth, height: triangleHeight)
                }
            }
            .frame(height: triangleHeight, alignment: .center)
        }
        .frame(height: 10)
    }
}

private struct TriangleUp: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

private struct CurvedLineSeparator: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                let width = geo.size.width
                let height: CGFloat = geo.size.height
                let amplitude: CGFloat = 8
                let waveLength: CGFloat = width // Lower frequency, one full wave across width
                path.move(to: CGPoint(x: 0, y: height / 2))
                let steps = Int(width)
                for i in 0...steps {
                    let x = CGFloat(i)
                    let y = sin(x / waveLength * .pi * 2) * amplitude / 2 + height / 2
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            .stroke(Color.secondary, lineWidth: 2)
        }
        .frame(height: 18)
    }
}

private struct IconDividerSeparator: View {
    var body: some View {
        HStack(spacing: 8) {
            Rectangle()
                .fill(Color.secondary)
                .frame(height: 2)
            Image(systemName: "star.fill")
                .foregroundColor(.accentColor)
                .imageScale(.medium)
            Rectangle()
                .fill(Color.secondary)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 2)
    }
}

#Preview {
    NavigationStack {
        Separators()
            .navigationTitle("Separators")
    }
    .frame(height: 600)
}
