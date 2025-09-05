//
// Menus.swift
// awesome-swiftui
//
// Created by Huy D. on 8/12/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI

struct Menus: View {
    @Environment(\.horizontalSizeClass) private var hSizeClass
    @Environment(\.dynamicTypeSize) private var dynamicType

    // Responsive tile width tuned for size class & Dynamic Type
    private var tileMinWidth: CGFloat {
        let base: CGFloat = (hSizeClass == .compact) ? 180 : 240
        switch dynamicType {
        case .xSmall, .small, .medium:
            return base
        case .large, .xLarge:
            return base + 12
        default:
            return base + 24
        }
    }

    // Adaptive grid using the responsive min width
    private var columns: [GridItem] {
        [ GridItem(.adaptive(minimum: tileMinWidth), spacing: 20, alignment: .top) ]
    }

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                ItemCard(title: "1. Basic Text Menu") { BasicTextMenuCard() }
                ItemCard(title: "2. Menu with Label (icon + text)") { LabelMenuCard() }
                ItemCard(title: "3. Menu with Multiple Sections") { MultiSectionMenuCard() }
                ItemCard(title: "4. Menu with Destructive Action") { DestructiveMenuCard() }
                ItemCard(title: "5. Nested Menu (Submenu inside)") { NestedMenuCard() }
                ItemCard(title: "6. Menu with Custom Styling (background color in label)") { StyledLabelMenuCard() }
                ItemCard(title: "7. Menu with Checkmark Selection") { CheckmarkSelectionMenuCard() }
                ItemCard(title: "8. Menu with Toggle-like Filters") { ToggleFiltersMenuCard() }
                ItemCard(title: "9. Menu with Dynamic Items (ForEach)") { DynamicItemsMenuCard() }
                ItemCard(title: "10. Menu with Disabled Items") { DisabledItemsMenuCard() }
                ItemCard(title: "11. Menu with Primary Action") { PrimaryActionMenuCard() }
                ItemCard(title: "12. Menu with Custom Label View (Avatar + Text)") { CustomLabelMenuCard() }
                ItemCard(title: "13. Icons-Only Menu Label") { IconsOnlyMenuCard() }
                ItemCard(title: "14. Menu with Mixed Roles") { MixedRolesMenuCard() }
                ItemCard(title: "15. Menu inside Toolbar-like HStack") { ToolbarMenuCard() }
                ItemCard(title: "16. Menu with Emoji Items") { EmojiMenuCard() }
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

// MARK: - Cards (split from Menus)

fileprivate struct BasicTextMenuCard: View {
    var body: some View {
        Menu("Choose Option") {
            Button("Option 1", action: {})
            Button("Option 2", action: {})
            Button("Option 3", action: {})
        }
    }
}

fileprivate struct LabelMenuCard: View {
    var body: some View {
        Menu {
            Button("Edit", systemImage: "pencil", action: {})
            Button("Share", systemImage: "square.and.arrow.up", action: {})
            Button("Duplicate", systemImage: "plus.square.on.square", action: {})
        } label: {
            Label("Actions", systemImage: "ellipsis.circle").font(.body)
        }
    }
}

fileprivate struct MultiSectionMenuCard: View {
    var body: some View {
        Menu("More Options") {
            Section {
                Button("Copy", action: {})
                Button("Paste", action: {})
            }
            Section {
                Button("Info", action: {})
                Button("Details", action: {})
            }
        }
    }
}

fileprivate struct DestructiveMenuCard: View {
    var body: some View {
        Menu("Danger Zone") {
            Button("Reset", action: {})
            Button(role: .destructive) { } label: { Label("Delete", systemImage: "trash") }
        }
    }
}

fileprivate struct NestedMenuCard: View {
    var body: some View {
        Menu("Choose Fruit") {
            Button("Apple", action: {})
            Button("Banana", action: {})
            Menu("Citrus") {
                Button("Orange", action: {})
                Button("Lemon", action: {})
            }
        }
    }
}

fileprivate struct StyledLabelMenuCard: View {
    var body: some View {
        Menu {
            Button("Red", action: {})
            Button("Blue", action: {})
            Button("Green", action: {})
        } label: {
            Text("Pick Color")
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.2))
                .cornerRadius(8)
        }
    }
}

fileprivate struct CheckmarkSelectionMenuCard: View {
    @State private var selectedColor = "Red"
    private let colorOptions = ["Red", "Green", "Blue", "Purple"]
    var body: some View {
        Menu {
            ForEach(colorOptions, id: \.self) { option in
                Button { selectedColor = option } label: {
                    HStack {
                        Text(option)
                        Spacer()
                        if selectedColor == option { Image(systemName: "checkmark") }
                    }
                }
            }
        } label: {
            Label("Selected: \(selectedColor)", systemImage: "paintpalette")
        }
    }
}

fileprivate struct ToggleFiltersMenuCard: View {
    @State private var showRead = true
    @State private var showStarred = false
    var body: some View {
        Menu {
            Button { showRead.toggle() } label: {
                Label(showRead ? "Hide Read" : "Show Read", systemImage: showRead ? "checkmark.circle.fill" : "circle")
            }
            Button { showStarred.toggle() } label: {
                Label(showStarred ? "Hide Starred" : "Show Starred", systemImage: showStarred ? "star.fill" : "star")
            }
        } label: {
            Label("Filters", systemImage: "line.3.horizontal.decrease.circle")
        }
    }
}

fileprivate struct DynamicItemsMenuCard: View {
    private let folders = ["Home", "Work", "Travel", "Personal"]
    var body: some View {
        Menu("Move to Folder") {
            ForEach(folders, id: \.self) { folder in
                Button(folder, action: { print("Move to \(folder)") })
            }
        }
    }
}

fileprivate struct DisabledItemsMenuCard: View {
    var body: some View {
        Menu("Export") {
            Button("PDF", action: {})
            Button("CSV", action: {})
            Button("XML", action: {}).disabled(true)
        }
    }
}

fileprivate struct PrimaryActionMenuCard: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            Menu("Download") {
                Button("Pause", action: {})
                Button("Resume", action: {})
                Button(role: .destructive) { } label: { Label("Cancel", systemImage: "xmark.circle") }
            } primaryAction: {
                print("Start download")
            }
        } else {
            Text("Primary action requires iOS 15+").foregroundColor(.secondary)
        }
    }
}

fileprivate struct CustomLabelMenuCard: View {
    var body: some View {
        Menu {
            Button("Profile", action: {})
            Button("Settings", action: {})
            Button("Sign Out", role: .destructive, action: {})
        } label: {
            HStack(spacing: 8) {
                Circle().fill(Color.blue.opacity(0.25)).frame(width: 28, height: 28)
                    .overlay(Image(systemName: "person.fill").imageScale(.small))
                Text("Account")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
    }
}

fileprivate struct IconsOnlyMenuCard: View {
    var body: some View {
        Menu {
            Button("Cut", systemImage: "scissors", action: {})
            Button("Copy", systemImage: "doc.on.doc", action: {})
            Button("Paste", systemImage: "doc.on.clipboard", action: {})
        } label: {
            Image(systemName: "ellipsis.circle.fill")
                .imageScale(.large)
                .padding(8)
                .background(Color.secondary.opacity(0.15))
                .clipShape(Circle())
        }
    }
}

fileprivate struct MixedRolesMenuCard: View {
    var body: some View {
        Menu("File Options") {
            Button("Open", systemImage: "folder", action: {})
            Button("Save", systemImage: "square.and.arrow.down", action: {})
            Button(role: .destructive) { } label: { Label("Delete File", systemImage: "trash") }
        }
    }
}

fileprivate struct ToolbarMenuCard: View {
    var body: some View {
        HStack {
            Button("Add", systemImage: "plus", action: {})
            Spacer()
            Menu {
                Button("Option A", action: {})
                Button("Option B", action: {})
            } label: { Label("More", systemImage: "ellipsis.circle") }
        }
        .padding(.horizontal)
    }
}

fileprivate struct EmojiMenuCard: View {
    var body: some View {
        Menu("Choose Emoji") {
            Button("😀 Smile", action: {})
            Button("🔥 Fire", action: {})
            Button("🌙 Moon", action: {})
            Button("🍎 Apple", action: {})
        }
    }
}

#Preview {
    NavigationStack {
        Menus()
            .navigationTitle("Menu Examples")
    }
    .frame(height: 600)
}
