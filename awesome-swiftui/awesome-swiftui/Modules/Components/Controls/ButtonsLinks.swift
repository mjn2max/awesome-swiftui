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
    // Adaptive grid with a reasonable minimum so buttons fit well on iPhone/iPad/Mac
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 180), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
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
                GradientCircleButton(title: "Circle Gradient", systemImage: "star") {
                    print("GradientCircleButton tapped")
                }
                BlurredBackgroundButton(title: "Blurred", systemImage: "drop") {
                    print("BlurredBackgroundButton tapped")
                }
                HoverScaleButton(title: "Hover Scale") {
                    print("HoverScaleButton tapped")
                }
                PulseButton(title: "Pulse", systemImage: "waveform.path") {
                    print("PulseButton tapped")
                }
                RotatingGradientButton(title: "Rotating Gradient") {
                    print("RotatingGradientButton tapped")
                }
                ShakeButton(title: "Shake") {
                    print("ShakeButton tapped")
                }
                FavoriteToggleButton(title: "Favorite") {
                    print("FavoriteToggleButton tapped")
                }
                LoadingButton(title: "Loading Action") {
                    print("LoadingButton fired")
                }
                LinkCapsule(title: "mjn2max.com", url: URL(string: "https://mjn2max.com")!)
                NavigationLinkTile(title: "Go to Details")
                ContextMenuActionButton(title: "More…") {
                    print("Context menu base tapped")
                }
                DestructiveButton(title: "Delete") {
                    print("DestructiveButton tapped")
                }
                GradientIconLink(title: "GitHub", url: URL(string: "https://github.com/mjn2max")!, systemImage: "chevron.left.slash.chevron.right")
                SocialShareButton(title: "Share") {
                    print("SocialShareButton tapped")
                }
                ToggleStyleButton(title: "Toggle Style") {
                    print("ToggleStyleButton tapped")
                }
                BadgeButton(title: "Inbox", systemImage: "tray.full", count: 12) {
                    print("BadgeButton tapped")
                }
                SegmentedControlButton(options: ["Day", "Week", "Month"]) { selection in
                    print("SegmentedControlButton selected: \(selection)")
                }
            }
            .padding(16)
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

// 15. GradientFillButton
fileprivate struct GradientFillButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(
                    LinearGradient(colors: [.pink, .purple, .blue], startPoint: .leading, endPoint: .trailing)
                        .cornerRadius(12)
                )
                .foregroundColor(.white)
                .shadow(radius: 4)
        }
        .buttonStyle(.plain)
    }
}

// 16. CircularProgressButton
fileprivate struct CircularProgressButton: View {
    var title: String
    var action: () -> Void
    @State private var progress = 0.0
    var body: some View {
        Button(action: {
            action()
            withAnimation(.linear(duration: 1.5)) {
                progress = progress >= 1.0 ? 0.0 : 1.0
            }
        }) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 6)
                    .frame(width: 50, height: 50)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1.5), value: progress)
                Image(systemName: "arrow.down.circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.blue)
            }
        }
        .buttonStyle(.plain)
    }
}

// 17. BouncyButton
fileprivate struct BouncyButton: View {
    var title: String
    var action: () -> Void
    @State private var bounce = false
    var body: some View {
        Button(action: {
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 5)) {
                bounce.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                bounce.toggle()
            }
            action()
        }) {
            Text(title)
                .fontWeight(.bold)
                .padding(.vertical, 12)
                .padding(.horizontal, 30)
                .background(Capsule().fill(Color.orange.opacity(0.2)))
                .scaleEffect(bounce ? 1.2 : 1.0)
        }
        .buttonStyle(.plain)
    }
}

// 18. FlipButton
fileprivate struct FlipButton: View {
    var title: String
    var action: () -> Void
    @State private var flipped = false
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.6)) {
                flipped.toggle()
            }
            action()
        }) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.teal.opacity(0.25))
                )
                .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
        }
        .buttonStyle(.plain)
    }
}

// 19. GradientCircleButton
fileprivate struct GradientCircleButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: systemImage)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                    .background(
                        Circle().fill(
                            LinearGradient(colors: [.pink, .purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    )
                    .foregroundColor(.white)
                Text(title)
                    .font(.footnote)
            }
        }
        .buttonStyle(.plain)
    }
}

// 20. BlurredBackgroundButton
fileprivate struct BlurredBackgroundButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: systemImage)
                Text(title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.ultraThinMaterial)
            )
        }
        .buttonStyle(.plain)
    }
}

// 21. HoverScaleButton
fileprivate struct HoverScaleButton: View {
    var title: String
    var action: () -> Void
    @State private var hovering = false
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(Capsule().fill(Color.blue.opacity(0.2)))
                .scaleEffect(hovering ? 1.1 : 1.0)
        }
        .buttonStyle(.plain)
        .onHover { isHovering in
            withAnimation(.easeInOut(duration: 0.2)) {
                hovering = isHovering
            }
        }
    }
}

// 22. PulseButton
fileprivate struct PulseButton: View {
    var title: String
    var systemImage: String
    var action: () -> Void
    @State private var animate = false
    var body: some View {
        Button(action: {
            animate.toggle()
            action()
        }) {
            HStack(spacing: 8) {
                Image(systemName: systemImage)
                    .scaleEffect(animate ? 1.2 : 1.0)
                    .animation(.easeInOut(duration: 0.4).repeatCount(1, autoreverses: true), value: animate)
                Text(title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(Capsule().fill(Color.pink.opacity(0.2)))
        }
        .buttonStyle(.plain)
    }
}

// 23. RotatingGradientButton
fileprivate struct RotatingGradientButton: View {
    var title: String
    var action: () -> Void
    @State private var rotate = false
    var body: some View {
        Button(action: {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                rotate.toggle()
            }
            action()
        }) {
            Text(title)
                .fontWeight(.bold)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(
                    AngularGradient(gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]), center: .center)
                        .rotationEffect(.degrees(rotate ? 360 : 0))
                        .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotate)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                )
                .foregroundColor(.white)
        }
        .buttonStyle(.plain)
    }
}

// 24. ShakeButton
fileprivate struct ShakeButton: View {
    var title: String
    var action: () -> Void
    @State private var offset: CGFloat = 0
    var body: some View {
        Button(action: {
            withAnimation(Animation.linear(duration: 0.1).repeatCount(5, autoreverses: true)) {
                offset = 10
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                offset = 0
            }
            action()
        }) {
            Text(title)
                .padding(.vertical, 12)
                .padding(.horizontal, 28)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.2)))
                .offset(x: offset)
        }
        .buttonStyle(.plain)
    }
}

// 25. FavoriteToggleButton
fileprivate struct FavoriteToggleButton: View {
    var title: String
    var action: () -> Void
    @State private var isFav = false
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                isFav.toggle()
            }
            action()
        }) {
            HStack(spacing: 8) {
                Image(systemName: isFav ? "heart.fill" : "heart")
                    .foregroundStyle(isFav ? Color.red : Color.secondary)
                Text(title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(Capsule().fill((isFav ? Color.red.opacity(0.15) : Color.gray.opacity(0.15))))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text(isFav ? "Remove Favorite" : "Mark Favorite"))
    }
}

// 26. LoadingButton
fileprivate struct LoadingButton: View {
    var title: String
    var action: () -> Void
    @State private var isLoading = false
    var body: some View {
        Button(action: {
            guard !isLoading else { return }
            isLoading = true
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                withAnimation { isLoading = false }
            }
        }) {
            HStack(spacing: 10) {
                if isLoading { ProgressView().scaleEffect(0.9) }
                Text(isLoading ? "Working…" : title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(Capsule().fill(Color.gray.opacity(0.15)))
        }
        .buttonStyle(.plain)
        .disabled(isLoading)
    }
}

// 27. LinkCapsule
fileprivate struct LinkCapsule: View {
    var title: String
    var url: URL
    var body: some View {
        Link(destination: url) {
            HStack(spacing: 8) {
                Image(systemName: "link")
                Text(title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(Capsule().stroke(Color.blue, lineWidth: 1.5))
        }
        .buttonStyle(.plain)
    }
}

// 28. NavigationLinkTile
fileprivate struct NavigationLinkTile: View {
    var title: String
    var body: some View {
        NavigationLink(destination: Text("Details View").padding().navigationTitle("Details")) {
            VStack(spacing: 8) {
                Image(systemName: "arrow.right.circle.fill").font(.system(size: 24))
                Text(title).font(.footnote)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue.opacity(0.12)))
        }
    }
}

// 29. ContextMenuActionButton
fileprivate struct ContextMenuActionButton: View {
    var title: String
    var action: () -> Void
    @State private var selected: String? = nil
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: "ellipsis.circle")
                Text(selected ?? title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.12)))
        }
        .buttonStyle(.plain)
        .contextMenu {
            Button("Duplicate", systemImage: "plus.square.on.square") { selected = "Duplicated" }
            Button("Archive", systemImage: "archivebox") { selected = "Archived" }
            Button(role: .destructive) { selected = "Deleted" } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

// 30. DestructiveButton
fileprivate struct DestructiveButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(role: .destructive, action: action) {
            HStack(spacing: 8) {
                Image(systemName: "trash")
                Text(title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 22)
            .background(Capsule().fill(Color.red.opacity(0.15)))
            .foregroundColor(.red)
        }
        .buttonStyle(.plain)
    }
}

// 31. GradientIconLink
fileprivate struct GradientIconLink: View {
    var title: String
    var url: URL
    var systemImage: String
    var body: some View {
        Link(destination: url) {
            HStack(spacing: 8) {
                Image(systemName: systemImage)
                    .foregroundStyle(LinearGradient(colors: [.purple, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                Text(title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 22)
            .background(RoundedRectangle(cornerRadius: 12).stroke(LinearGradient(colors: [.purple, .pink], startPoint: .leading, endPoint: .trailing), lineWidth: 2))
        }
        .buttonStyle(.plain)
    }
}

// 32. SocialShareButton
fileprivate struct SocialShareButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: "square.and.arrow.up")
                Text(title)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 22)
            .background(Capsule().fill(Color.blue.opacity(0.15)))
        }
        .buttonStyle(.plain)
    }
}

// 33. ToggleStyleButton
fileprivate struct ToggleStyleButton: View {
    var title: String
    var action: () -> Void
    @State private var toggled = false
    var body: some View {
        Button(action: {
            toggled.toggle()
            action()
        }) {
            Text(title)
                .fontWeight(.semibold)
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
                .background(RoundedRectangle(cornerRadius: 12).fill(toggled ? Color.green.opacity(0.3) : Color.gray.opacity(0.2)))
        }
        .buttonStyle(.plain)
    }
}

// 34. BadgeButton
fileprivate struct BadgeButton: View {
    var title: String
    var systemImage: String
    var count: Int
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: systemImage)
                Text(title)
                Spacer(minLength: 8)
                Text("\(count)")
                    .font(.caption).bold()
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8)
                    .background(Capsule().fill(Color.red))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text("\(title), \(count) new"))
    }
}

// 35. SegmentedControlButton
fileprivate struct SegmentedControlButton: View {
    var options: [String]
    var onSelect: (String) -> Void
    @State private var selected: String
    init(options: [String], onSelect: @escaping (String) -> Void) {
        self.options = options
        self.onSelect = onSelect
        _selected = State(initialValue: options.first ?? "")
    }
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options, id: \.self) { opt in
                Button(action: {
                    selected = opt
                    onSelect(opt)
                }) {
                    Text(opt)
                        .font(.subheadline).bold()
                        .padding(.vertical, 8)
                        .frame(minWidth: 64)
                        .background(selected == opt ? Color.accentColor : Color.clear)
                        .foregroundColor(selected == opt ? .white : .accentColor)
                }
                .buttonStyle(.plain)
                if opt != options.last { Divider().frame(height: 24) }
            }
        }
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.accentColor, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.accentColor.opacity(0.08)))
        )
    }
}
