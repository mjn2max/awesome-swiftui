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
    @State private var selectedColor = "Red"
    @State private var showRead = true
    @State private var showStarred = false
    private let colorOptions = ["Red", "Green", "Blue", "Purple"]
    private let folders = ["Home", "Work", "Travel", "Personal"]
    // Adaptive grid for a card-like menu gallery
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 260), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
                // 1. Basic text menu
                VStack(alignment: .leading, spacing: 8) {
                    Text("1. Basic Text Menu")
                        .font(.headline)
                    Menu("Choose Option") {
                        Button("Option 1", action: {})
                        Button("Option 2", action: {})
                        Button("Option 3", action: {})
                    }
                }

                // 2. Menu with Label (icon + text)
                VStack(alignment: .leading, spacing: 8) {
                    Text("2. Menu with Label (icon + text)")
                        .font(.headline)
                    Menu {
                        Button("Edit", systemImage: "pencil", action: {})
                        Button("Share", systemImage: "square.and.arrow.up", action: {})
                        Button("Duplicate", systemImage: "plus.square.on.square", action: {})
                    } label: {
                        Label("Actions", systemImage: "ellipsis.circle")
                            .font(.body)
                    }
                }

                // 3. Menu with Multiple Sections
                VStack(alignment: .leading, spacing: 8) {
                    Text("3. Menu with Multiple Sections")
                        .font(.headline)
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

                // 4. Menu with Destructive Action
                VStack(alignment: .leading, spacing: 8) {
                    Text("4. Menu with Destructive Action")
                        .font(.headline)
                    Menu("Danger Zone") {
                        Button("Reset", action: {})
                        Button(role: .destructive) {
                            // Destructive action
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }

                // 5. Nested Menu (Submenu inside)
                VStack(alignment: .leading, spacing: 8) {
                    Text("5. Nested Menu (Submenu inside)")
                        .font(.headline)
                    Menu("Choose Fruit") {
                        Button("Apple", action: {})
                        Button("Banana", action: {})
                        Menu("Citrus") {
                            Button("Orange", action: {})
                            Button("Lemon", action: {})
                        }
                    }
                }

                // 6. Menu with Custom Styling (background color in label)
                VStack(alignment: .leading, spacing: 8) {
                    Text("6. Menu with Custom Styling (background color in label)")
                        .font(.headline)
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

                // 7. Menu with Checkmark Selection
                VStack(alignment: .leading, spacing: 8) {
                    Text("7. Menu with Checkmark Selection")
                        .font(.headline)
                    Menu {
                        ForEach(colorOptions, id: \.self) { option in
                            Button {
                                selectedColor = option
                            } label: {
                                HStack {
                                    Text(option)
                                    Spacer()
                                    if selectedColor == option {
                                        Image(systemName: "checkmark")
                                    }
                                }
                            }
                        }
                    } label: {
                        Label("Selected: \(selectedColor)", systemImage: "paintpalette")
                    }
                }

                // 8. Menu with Toggle-like Filters
                VStack(alignment: .leading, spacing: 8) {
                    Text("8. Menu with Toggle-like Filters")
                        .font(.headline)
                    Menu {
                        Button {
                            showRead.toggle()
                        } label: {
                            Label(showRead ? "Hide Read" : "Show Read", systemImage: showRead ? "checkmark.circle.fill" : "circle")
                        }
                        Button {
                            showStarred.toggle()
                        } label: {
                            Label(showStarred ? "Hide Starred" : "Show Starred", systemImage: showStarred ? "star.fill" : "star")
                        }
                    } label: {
                        Label("Filters", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }

                // 9. Menu with Dynamic Items (ForEach)
                VStack(alignment: .leading, spacing: 8) {
                    Text("9. Menu with Dynamic Items (ForEach)")
                        .font(.headline)
                    Menu("Move to Folder") {
                        ForEach(folders, id: \.self) { folder in
                            Button(folder, action: { print("Move to \(folder)") })
                        }
                    }
                }

                // 10. Menu with Disabled Items
                VStack(alignment: .leading, spacing: 8) {
                    Text("10. Menu with Disabled Items")
                        .font(.headline)
                    Menu("Export") {
                        Button("PDF", action: {})
                        Button("CSV", action: {})
                        Button("XML", action: {})
                            .disabled(true)
                    }
                }

                // 11. Menu with Primary Action
                VStack(alignment: .leading, spacing: 8) {
                    Text("11. Menu with Primary Action")
                        .font(.headline)
                    if #available(iOS 15.0, *) {
                        Menu("Download") {
                            Button("Pause", action: {})
                            Button("Resume", action: {})
                            Button(role: .destructive) { } label: { Label("Cancel", systemImage: "xmark.circle") }
                        } primaryAction: {
                            print("Start download")
                        }
                    } else {
                        Text("Primary action requires iOS 15+")
                            .foregroundColor(.secondary)
                    }
                }

                // 12. Menu with Custom Label View (Avatar + Text)
                VStack(alignment: .leading, spacing: 8) {
                    Text("12. Menu with Custom Label View (Avatar + Text)")
                        .font(.headline)
                    Menu {
                        Button("Profile", action: {})
                        Button("Settings", action: {})
                        Button("Sign Out", role: .destructive, action: {})
                    } label: {
                        HStack(spacing: 8) {
                            Circle()
                                .fill(Color.blue.opacity(0.25))
                                .frame(width: 28, height: 28)
                                .overlay(Image(systemName: "person.fill").imageScale(.small))
                            Text("Account")
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                    }
                }

                // 13. Icons-Only Menu Label
                VStack(alignment: .leading, spacing: 8) {
                    Text("13. Icons-Only Menu Label")
                        .font(.headline)
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

                // 14. Menu with Mixed Roles
                VStack(alignment: .leading, spacing: 8) {
                    Text("14. Menu with Mixed Roles")
                        .font(.headline)
                    Menu("File Options") {
                        Button("Open", systemImage: "folder", action: {})
                        Button("Save", systemImage: "square.and.arrow.down", action: {})
                        Button(role: .destructive) {
                        } label: {
                            Label("Delete File", systemImage: "trash")
                        }
                    }
                }

                // 15. Menu inside Toolbar-like HStack
                VStack(alignment: .leading, spacing: 8) {
                    Text("15. Menu inside Toolbar-like HStack")
                        .font(.headline)
                    HStack {
                        Button("Add", systemImage: "plus", action: {})
                        Spacer()
                        Menu {
                            Button("Option A", action: {})
                            Button("Option B", action: {})
                        } label: {
                            Label("More", systemImage: "ellipsis.circle")
                        }
                    }
                    .padding(.horizontal)
                }

                // 16. Menu with Emoji Items
                VStack(alignment: .leading, spacing: 8) {
                    Text("16. Menu with Emoji Items")
                        .font(.headline)
                    Menu("Choose Emoji") {
                        Button("😀 Smile", action: {})
                        Button("🔥 Fire", action: {})
                        Button("🌙 Moon", action: {})
                        Button("🍎 Apple", action: {})
                    }
                }
            }
            .padding(16)
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
