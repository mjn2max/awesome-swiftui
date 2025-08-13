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
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
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
            }
            .padding()
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
