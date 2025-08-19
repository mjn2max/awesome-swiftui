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
        ScrollView {
            LazyVStack(spacing: 20) {
                PrimaryGradientButton(title: "Get Started") {
                    print("PrimaryGradientButton tapped")
                }
                IconCapsuleButton(title: "Settings", systemImage: "gear") {
                    print("IconCapsuleButton tapped")
                }
                AnimatedPressButton(title: "Tap Me") {
                    print("AnimatedPressButton tapped")
                }
                OutlineButton(title: "Learn More", color: .green) {
                    print("OutlineButton tapped")
                }
                NeumorphicButton(title: "Play", systemImage: "play.fill") {
                    print("NeumorphicButton tapped")
                }
                GlassmorphicButton(title: "Glassmorphic", systemImage: "sparkles") {
                    print("GlassmorphicButton tapped")
                }
                ShadowedIconButton(title: "Shadowed", systemImage: "bolt.fill") {
                    print("ShadowedIconButton tapped")
                }
                DashedBorderButton(title: "Dashed Border", systemImage: "scissors") {
                    print("DashedBorderButton tapped")
                }
                PillGradientButton(title: "Pill Gradient", systemImage: "capsule") {
                    print("PillGradientButton tapped")
                }
                RotatingIconButton(title: "Rotating Icon", systemImage: "arrow.2.circlepath") {
                    print("RotatingIconButton tapped")
                }
                GlowButton(title: "Glow", systemImage: "lightbulb") {
                    print("GlowButton tapped")
                }
                OutlinedIconButton(title: "Outlined", systemImage: "person.crop.circle") {
                    print("OutlinedIconButton tapped")
                }
                EmbossedButton(title: "Embossed", systemImage: "star.fill") {
                    print("EmbossedButton tapped")
                }
                StripeBackgroundButton(title: "Stripe", systemImage: "line.3.horizontal") {
                    print("StripeBackgroundButton tapped")
                }
                RippleEffectButton(title: "Ripple", systemImage: "drop.fill") {
                    print("RippleEffectButton tapped")
                }

                GradientBorderButton(title: "Gradient Border") {
                    print("GradientBorderButton tapped")
                }
                ShimmerButton(title: "Shimmer") {
                    print("ShimmerButton tapped")
                }
                IconOnlyButton(systemImage: "heart.fill") {
                    print("IconOnlyButton tapped")
                }
                SkewedButton(title: "Skewed") {
                    print("SkewedButton tapped")
                }
                GradientFillButton(title: "Gradient Fill") {
                    print("GradientFillButton tapped")
                }
                CircularProgressButton(title: "Download") {
                    print("CircularProgressButton tapped")
                }
                BouncyButton(title: "Bouncy") {
                    print("BouncyButton tapped")
                }
                FlipButton(title: "Flip") {
                    print("FlipButton tapped")
                }
            }
            .padding()
        }
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

fileprivate struct OutlineButton: View {
    var title: String
    var color: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
                .foregroundColor(color)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(color, lineWidth: 2)
                )
        }
        .buttonStyle(.plain)
    }
}

fileprivate struct NeumorphicButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 24)
            .background(
                Color(.systemBackground)
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 6, x: 6, y: 6)
                    .shadow(color: Color.white.opacity(0.7), radius: 6, x: -6, y: -6)
            )
            .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

// 1. GlassmorphicButton
fileprivate struct GlassmorphicButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.semibold)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 28)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(.ultraThinMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.white.opacity(0.25), lineWidth: 1.5)
                        )
                        .shadow(color: .white.opacity(0.25), radius: 6, x: 0, y: 4)
                }
            )
            .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

// 2. ShadowedIconButton
fileprivate struct ShadowedIconButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: systemImage)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.yellow)
                    .shadow(color: .yellow.opacity(0.7), radius: 8, x: 0, y: 4)
                Text(title)
                    .fontWeight(.semibold)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 22)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemGray6))
                    .shadow(color: .black.opacity(0.18), radius: 8, x: 0, y: 6)
            )
        }
        .buttonStyle(.plain)
    }
}

// 3. DashedBorderButton
fileprivate struct DashedBorderButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(
                RoundedRectangle(cornerRadius: 13)
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [8, 5]))
                    .foregroundColor(.purple)
            )
            .foregroundColor(.purple)
        }
        .buttonStyle(.plain)
    }
}

// 4. PillGradientButton
fileprivate struct PillGradientButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(
                Capsule()
                    .fill(LinearGradient(
                        colors: [Color.pink, Color.orange, Color.yellow],
                        startPoint: .leading,
                        endPoint: .trailing)
                    )
            )
            .foregroundColor(.white)
            .shadow(color: .orange.opacity(0.25), radius: 8, x: 0, y: 6)
        }
        .buttonStyle(.plain)
    }
}

// 5. RotatingIconButton
fileprivate struct RotatingIconButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    @State private var isRotating = false
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.7)) {
                isRotating.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                isRotating.toggle()
            }
            action()
        }) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .rotationEffect(.degrees(isRotating ? 360 : 0))
                    .animation(.easeInOut(duration: 0.7), value: isRotating)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(
                Capsule()
                    .fill(Color.blue.opacity(0.15))
            )
            .foregroundColor(.blue)
        }
        .buttonStyle(.plain)
    }
}

// 6. GlowButton
fileprivate struct GlowButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    @State private var glow = false
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.3)) {
                glow.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                glow.toggle()
            }
            action()
        }) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 28)
            .background(
                Capsule()
                    .fill(Color.green)
                    .shadow(color: Color.green.opacity(glow ? 0.7 : 0.3), radius: glow ? 18 : 8)
            )
            .foregroundColor(.white)
        }
        .buttonStyle(.plain)
    }
}

// 7. OutlinedIconButton
fileprivate struct OutlinedIconButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .overlay(
                Capsule()
                    .stroke(Color.blue, lineWidth: 2)
            )
            .foregroundColor(.blue)
        }
        .buttonStyle(.plain)
    }
}

// 8. EmbossedButton
fileprivate struct EmbossedButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 28)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.systemGray5))
                    .shadow(color: Color.white.opacity(0.7), radius: 4, x: -3, y: -3)
                    .shadow(color: Color.black.opacity(0.15), radius: 4, x: 3, y: 3)
            )
            .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}

// 9. StripeBackgroundButton
fileprivate struct StripeBackgroundButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                    .font(.system(size: 18, weight: .medium))
                Text(title)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 13)
            .padding(.horizontal, 28)
            .background(
                ZStack {
                    GeometryReader { geo in
                        let stripeCount = 8
                        HStack(spacing: 0) {
                            ForEach(0..<stripeCount, id: \.self) { i in
                                Rectangle()
                                    .fill(i % 2 == 0 ? Color.blue.opacity(0.18) : Color.clear)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .frame(height: 44)
                }
            )
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.blue, lineWidth: 1.2)
            )
            .foregroundColor(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .buttonStyle(.plain)
    }
}

// 10. RippleEffectButton
fileprivate struct RippleEffectButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    @State private var animateRipple = false
    @State private var showRipple = false
    var body: some View {
        Button(action: {
            showRipple = true
            animateRipple = false
            withAnimation(Animation.easeOut(duration: 0.6)) {
                animateRipple = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                showRipple = false
            }
            action()
        }) {
            ZStack {
                if showRipple {
                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .scaleEffect(animateRipple ? 2.5 : 0.1)
                        .opacity(animateRipple ? 0 : 1)
                        .animation(.easeOut(duration: 0.6), value: animateRipple)
                }
                HStack(spacing: 10) {
                    Image(systemName: systemImage)
                        .font(.system(size: 18, weight: .medium))
                    Text(title)
                        .fontWeight(.medium)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 28)
                .background(
                    Capsule()
                        .fill(Color.blue.opacity(0.15))
                )
                .foregroundColor(.blue)
            }
            .clipShape(Capsule())
        }
        .buttonStyle(.plain)
    }
}

// 11. GradientBorderButton
fileprivate struct GradientBorderButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(LinearGradient(
                            colors: [Color.pink, Color.orange, Color.purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        ), lineWidth: 3)
                )
        }
        .buttonStyle(.plain)
    }
}

// 12. ShimmerButton
fileprivate struct ShimmerButton: View {
    var title: String
    var action: () -> Void
    @State private var shimmer = false
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.bold)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.blue.opacity(0.2))
                        RoundedRectangle(cornerRadius: 14)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.white.opacity(0.4), Color.clear, Color.white.opacity(0.4)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .rotationEffect(.degrees(30))
                            .offset(x: shimmer ? 150 : -150)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        shimmer.toggle()
                    }
                }
        }
        .buttonStyle(.plain)
    }
}

// 13. IconOnlyButton
fileprivate struct IconOnlyButton: View {
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 20, weight: .bold))
                .padding()
                .background(Circle().fill(Color.red.opacity(0.2)))
                .foregroundColor(.red)
        }
        .buttonStyle(.plain)
    }
}

// 14. SkewedButton
fileprivate struct SkewedButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.purple.opacity(0.25))
                        .rotationEffect(.degrees(3), anchor: .center)
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        ButtonsLinks()
    }
    .frame(height: 600)
}
