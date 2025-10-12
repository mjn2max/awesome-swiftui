//
// Pickers.swift
// awesome-swiftui
//
// Created by Huy D. on 10/10/25
// mjn2max.github.io 😜
// 
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct Pickers: View {
    @Environment(\.horizontalSizeClass) private var hSizeClass
    @Environment(\.dynamicTypeSize) private var dynamicType

    // Responsive tile width tuned for size class & Dynamic Type
    private var tileMinWidth: CGFloat {
        let base: CGFloat = (hSizeClass == .compact) ? 180 : 240
        switch dynamicType {
        case .xSmall, .small, .medium: return base
        case .large, .xLarge: return base + 12
        default: return base + 24
        }
    }

    // Adaptive grid using the responsive min width
    private var columns: [GridItem] {
        [ GridItem(.adaptive(minimum: tileMinWidth), spacing: 20, alignment: .top) ]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                ItemCard(title: "1. Basic Picker (Inline)") { BasicInlinePickerCard() }
                ItemCard(title: "2. Segmented Picker") { SegmentedPickerCard() }
                ItemCard(title: "3. Menu Picker Style") { MenuPickerCard() }
                ItemCard(title: "4. Wheel Picker Style") { WheelPickerCard() }
                ItemCard(title: "5. Date Picker (Date)") { DateOnlyPickerCard() }
                ItemCard(title: "6. Date Picker (Time)") { TimeOnlyPickerCard() }
                ItemCard(title: "7. Color Picker") { ColorPickerCard() }
                ItemCard(title: "8. Picker with Icons") { IconPickerCard() }
                ItemCard(title: "9. Range Picker (Bound Int)") { RangeIntPickerCard() }
                ItemCard(title: "10. Multi-Component Picker (Two pickers)") { MultiComponentPickerCard() }
                ItemCard(title: "11. Wheel Picker with Binding Formatter") { WheelPickerFormattedCard() }
                ItemCard(title: "12. Enum-backed Picker") { EnumPickerCard() }
            }
            .padding(20)
            .frame(maxWidth: 1100)
            .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Reusable ItemCard (mirrors Indicator-style container)
fileprivate struct ItemCard<Content: View>: View {
    private let title: String
    private let content: Content
    private let cardHeight: CGFloat

    init(title: String, height: CGFloat = 180, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
        self.cardHeight = height
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline)
            content
        }
        .padding(12)
        .frame(minWidth: 160, maxWidth: .infinity, alignment: .topLeading)
        .frame(height: cardHeight)
        .frame(minHeight: cardHeight, maxHeight: cardHeight)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.primary.opacity(0.06), lineWidth: 1)
        )
        .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        #if os(iOS)
        .hoverEffect(.highlight)
        #endif
        .shadow(color: Color.black.opacity(0.06), radius: 10, x: 0, y: 4)
    }
}

// MARK: - Cards

fileprivate struct BasicInlinePickerCard: View {
    @State private var selection: String = "Apple"
    private let fruits = ["Apple", "Banana", "Orange", "Grape", "Peach"]
    var body: some View {
        Picker("Fruit", selection: $selection) {
            ForEach(fruits, id: \.self) { Text($0) }
        }
        .pickerStyle(.inline)
    }
}

fileprivate struct SegmentedPickerCard: View {
    @State private var tab: Int = 0
    var body: some View {
        Picker("Segments", selection: $tab) {
            Text("Day").tag(0)
            Text("Week").tag(1)
            Text("Month").tag(2)
        }
        .pickerStyle(.segmented)
    }
}

fileprivate struct MenuPickerCard: View {
    @State private var choice = "Red"
    private let colors = ["Red", "Green", "Blue", "Purple"]
    var body: some View {
        Picker("Color", selection: $choice) {
            ForEach(colors, id: \.self) { Text($0) }
        }
        .pickerStyle(.menu)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

fileprivate struct WheelPickerCard: View {
    @State private var number = 5
    var body: some View {
        Picker("Number", selection: $number) {
            ForEach(0..<21) { Text("\($0)").tag($0) }
        }
        .pickerStyle(.wheel)
    }
}

fileprivate struct DateOnlyPickerCard: View {
    @State private var date = Date()
    var body: some View {
        DatePicker("Date", selection: $date, displayedComponents: .date)
            .labelsHidden()
    }
}

fileprivate struct TimeOnlyPickerCard: View {
    @State private var date = Date()
    var body: some View {
        DatePicker("Time", selection: $date, displayedComponents: .hourAndMinute)
            .labelsHidden()
    }
}

fileprivate struct ColorPickerCard: View {
    @State private var color: Color = .blue
    var body: some View {
        ColorPicker("Accent", selection: $color, supportsOpacity: true)
            .labelsHidden()
    }
}

fileprivate struct IconPickerCard: View {
    @State private var icon = "house"
    private let options = ["house", "star", "heart", "paperplane", "flame"]
    var body: some View {
        Picker("Icon", selection: $icon) {
            ForEach(options, id: \.self) { name in
                Label(name.capitalized, systemImage: name).tag(name)
            }
        }
        .pickerStyle(.menu)
    }
}

fileprivate struct RangeIntPickerCard: View {
    @State private var value: Int = 50
    var body: some View {
        Picker("Value", selection: $value) {
            ForEach(0...100, id: \.self) { v in
                Text("\(v)").tag(v)
            }
        }
        .pickerStyle(.wheel)
    }
}

fileprivate struct MultiComponentPickerCard: View {
    @State private var hour = 9
    @State private var minute = 30
    var body: some View {
        HStack {
            Picker("Hour", selection: $hour) {
                ForEach(0..<24) { Text(String(format: "%02d", $0)).tag($0) }
            }
            .frame(maxWidth: .infinity)
            .clipped()
            Picker("Minute", selection: $minute) {
                ForEach(0..<60) { Text(String(format: "%02d", $0)).tag($0) }
            }
            .frame(maxWidth: .infinity)
            .clipped()
        }
    }
}

fileprivate struct WheelPickerFormattedCard: View {
    @State private var index = 0
    private let temps = Array(-20...50)
    var body: some View {
        Picker("Temperature °C", selection: $index) {
            ForEach(temps.indices, id: \.self) { i in
                Text("\(temps[i]) °C").tag(i)
            }
        }
        .pickerStyle(.wheel)
    }
}

fileprivate enum Priority: String, CaseIterable, Identifiable {
    case low = "Low", medium = "Medium", high = "High"
    var id: String { rawValue }
}

fileprivate struct EnumPickerCard: View {
    @State private var priority: Priority = .medium
    var body: some View {
        Picker("Priority", selection: $priority) {
            ForEach(Priority.allCases) { p in
                Text(p.rawValue).tag(p)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    NavigationStack {
        Pickers()
            .navigationTitle("Pickers")
            .frame(height: 900)
    }
}
