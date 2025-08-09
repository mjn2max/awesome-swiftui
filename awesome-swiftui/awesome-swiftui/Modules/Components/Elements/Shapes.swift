//
// Shapes.swift
// awesome-swiftui
//
// Created by Huy D. on 8/9/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct Shapes: View {
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 28) {
                // 1. Circle
                VStack {
                    CircleExample()
                    Text("Circle")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 2. RoundedRectangle
                VStack {
                    RoundedRectangleExample()
                    Text("RoundedRectangle")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 3. Capsule
                VStack {
                    CapsuleExample()
                    Text("Capsule")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 4. Ellipse
                VStack {
                    EllipseExample()
                    Text("Ellipse")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 5. Triangle
                VStack {
                    TriangleExample()
                    Text("Triangle")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 6. Star
                VStack {
                    StarExample()
                    Text("Star")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 7. Hexagon
                VStack {
                    HexagonExample()
                    Text("Hexagon")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 8. Wave
                VStack {
                    WaveExample()
                    Text("Wave")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 9. Diamond
                VStack {
                    DiamondExample()
                    Text("Diamond")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 10. Heart
                VStack {
                    HeartExample()
                    Text("Heart")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 11. Pentagon
                VStack {
                    PentagonExample()
                    Text("Pentagon")
                        .font(.headline)
                        .padding(.top, 6)
                }
                // 12. Parallelogram
                VStack {
                    ParallelogramExample()
                    Text("Parallelogram")
                        .font(.headline)
                        .padding(.top, 6)
                }
            }
            .padding()
        }
    }
}
// MARK: - New Shape Examples

private struct DiamondExample: View {
    var body: some View {
        DiamondShape()
            .fill(
                LinearGradient(
                    colors: [.purple, .pink],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct HeartExample: View {
    var body: some View {
        HeartShape()
            .fill(
                LinearGradient(
                    colors: [.red, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct PentagonExample: View {
    var body: some View {
        PentagonShape()
            .fill(
                LinearGradient(
                    colors: [.blue, .cyan],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct ParallelogramExample: View {
    var body: some View {
        ParallelogramShape()
            .fill(
                LinearGradient(
                    colors: [.orange, .yellow],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}
// MARK: - New Shape Structs

private struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.closeSubpath()
        return path
    }
}

private struct HeartShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let topCurveHeight = height * 0.3
        var path = Path()
        path.move(to: CGPoint(x: center.x, y: height * 0.95))
        path.addCurve(
            to: CGPoint(x: rect.minX, y: height * 0.4),
            control1: CGPoint(x: center.x, y: height * 0.75),
            control2: CGPoint(x: rect.minX, y: height * 0.7)
        )
        path.addArc(
            center: CGPoint(x: width * 0.25, y: height * 0.25),
            radius: topCurveHeight,
            startAngle: .degrees(135),
            endAngle: .degrees(-45),
            clockwise: true
        )
        path.addArc(
            center: CGPoint(x: width * 0.75, y: height * 0.25),
            radius: topCurveHeight,
            startAngle: .degrees(225),
            endAngle: .degrees(45),
            clockwise: true
        )
        path.addCurve(
            to: CGPoint(x: center.x, y: height * 0.95),
            control1: CGPoint(x: rect.maxX, y: height * 0.7),
            control2: CGPoint(x: center.x, y: height * 0.75)
        )
        path.closeSubpath()
        return path
    }
}

private struct PentagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        var path = Path()
        for i in 0..<5 {
            let angle = (Double(i) * 2 * .pi / 5) - .pi / 2
            let x = center.x + CGFloat(cos(angle)) * radius
            let y = center.y + CGFloat(sin(angle)) * radius
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}

private struct ParallelogramShape: Shape {
    func path(in rect: CGRect) -> Path {
        let slant: CGFloat = rect.width * 0.3
        var path = Path()
        path.move(to: CGPoint(x: rect.minX + slant, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - slant, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

private struct CircleExample: View {
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct RoundedRectangleExample: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
                LinearGradient(
                    colors: [.green, .mint],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct CapsuleExample: View {
    var body: some View {
        Capsule()
            .fill(
                LinearGradient(
                    colors: [.orange, .yellow],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct EllipseExample: View {
    var body: some View {
        Ellipse()
            .fill(
                RadialGradient(
                    gradient: Gradient(colors: [.pink, .red]),
                    center: .center,
                    startRadius: 10,
                    endRadius: 50
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct TriangleExample: View {
    var body: some View {
        TriangleShape()
            .fill(
                LinearGradient(
                    colors: [.teal, .cyan],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct StarExample: View {
    var body: some View {
        StarShape(points: 5)
            .fill(
                AngularGradient(
                    gradient: Gradient(colors: [.yellow, .orange, .yellow]),
                    center: .center
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct HexagonExample: View {
    var body: some View {
        HexagonShape()
            .fill(
                LinearGradient(
                    colors: [.indigo, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

private struct WaveExample: View {
    var body: some View {
        WaveShape()
            .fill(
                LinearGradient(
                    colors: [.mint, .blue],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(width: 100, height: 100)
            .shadow(radius: 4)
    }
}

// MARK: - Custom Shapes

private struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

private struct StarShape: Shape {
    let points: Int
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let angle = .pi * 2 / Double(points * 2)
        var path = Path()
        for i in 0..<(points * 2) {
            let r = i.isMultiple(of: 2) ? radius : radius * 0.4
            let x = center.x + CGFloat(cos(Double(i) * angle - .pi/2)) * r
            let y = center.y + CGFloat(sin(Double(i) * angle - .pi/2)) * r
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}

private struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = min(width, height) / 2
        var path = Path()
        for i in 0..<6 {
            let angle = (Double(i) * .pi / 3) - .pi/2
            let x = center.x + CGFloat(cos(angle)) * radius
            let y = center.y + CGFloat(sin(angle)) * radius
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}

private struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let amplitude: CGFloat = rect.height / 5
        let midY = rect.midY
        path.move(to: CGPoint(x: rect.minX, y: midY))
        for x in stride(from: rect.minX, through: rect.maxX, by: 1) {
            let relativeX = x / rect.width
            let sine = sin(relativeX * .pi * 2)
            let y = midY + sine * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    NavigationStack {
        Shapes()
            .navigationTitle("Shapes")
    }
    .frame(height: 600)
}
