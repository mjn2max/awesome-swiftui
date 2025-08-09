//
// Charts.swift
// awesome-swiftui
//
// Created by Huy D. on 8/9/25
// mjn2max.github.io 😜
//
// Copyright © 2025. All rights reserved.
// mjn2max.com
//

import SwiftUI
#if canImport(Charts)
import Charts
#endif

struct Charts: View {
#if canImport(Charts)
    // Sample Data Models
    struct SalesData: Identifiable {
        let id = UUID()
        let month: String
        let sales: Double
    }
    struct CategoryData: Identifiable {
        let id = UUID()
        let category: String
        let value: Double
    }
    struct PointData: Identifiable {
        let id = UUID()
        let x: Double
        let y: Double
    }

    // Sample Data
    let sales: [SalesData] = [
        .init(month: "Jan", sales: 120),
        .init(month: "Feb", sales: 150),
        .init(month: "Mar", sales: 90),
        .init(month: "Apr", sales: 170),
        .init(month: "May", sales: 140),
        .init(month: "Jun", sales: 200)
    ]
    let categories: [CategoryData] = [
        .init(category: "A", value: 30),
        .init(category: "B", value: 20),
        .init(category: "C", value: 25),
        .init(category: "D", value: 10),
        .init(category: "E", value: 15)
    ]
    let points: [PointData] = [
        .init(x: 1, y: 2),
        .init(x: 2, y: 4),
        .init(x: 3, y: 3),
        .init(x: 4, y: 6),
        .init(x: 5, y: 5)
    ]

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                // Simple Bar Chart
                Text("Simple Bar Chart")
                    .font(.headline)
                Chart(sales) {
                    BarMark(
                        x: .value("Month", $0.month),
                        y: .value("Sales", $0.sales)
                    )
                }
                .frame(height: 200)
                .padding(.horizontal)

                // Line Chart
                Text("Line Chart")
                    .font(.headline)
                Chart(sales) {
                    LineMark(
                        x: .value("Month", $0.month),
                        y: .value("Sales", $0.sales)
                    )
                }
                .frame(height: 200)
                .padding(.horizontal)

                // Area Chart
                Text("Area Chart")
                    .font(.headline)
                Chart(sales) {
                    AreaMark(
                        x: .value("Month", $0.month),
                        y: .value("Sales", $0.sales)
                    )
                    .foregroundStyle(.blue.gradient)
                }
                .frame(height: 200)
                .padding(.horizontal)

                // Pie Chart (SectorMark)
                Text("Pie Chart")
                    .font(.headline)
                if #available(iOS 17.0, *) {
                    Chart(categories) {
                        SectorMark(
                            angle: .value("Value", $0.value),
                            innerRadius: .ratio(0.5),
                            angularInset: 1
                        )
                        .foregroundStyle(by: .value("Category", $0.category))
                    }
                    .frame(height: 200)
                    .padding(.horizontal)
                } else {
                    Text("Pie Chart requires iOS 17 or newer")
                        .foregroundColor(.secondary)
                        .frame(height: 200)
                }

                // Point Chart
                Text("Point Chart")
                    .font(.headline)
                Chart(points) {
                    PointMark(
                        x: .value("X", $0.x),
                        y: .value("Y", $0.y)
                    )
                }
                .frame(height: 200)
                .padding(.horizontal)

                // Mixed Chart (Line + Points)
                Text("Mixed Chart (Line + Points)")
                    .font(.headline)
                Chart(points) {
                    LineMark(
                        x: .value("X", $0.x),
                        y: .value("Y", $0.y)
                    )
                    PointMark(
                        x: .value("X", $0.x),
                        y: .value("Y", $0.y)
                    )
                }
                .frame(height: 200)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
#else
    var body: some View {
        Text("Charts framework is not available.")
    }
#endif
}

#Preview {
    NavigationStack {
        Charts()
            .navigationTitle("Charts")
    }
    .frame(height: 600)
}
