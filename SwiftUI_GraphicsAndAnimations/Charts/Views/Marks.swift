//
//  Marks.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI
import Charts

struct Marks: View {
    
    @State private var data = ApplicationData(
        listOfItems: Consumables.sampleData,
        sales: Product.sampleData
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Chart(data.consumables) { item in
                    BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                }
                .frame(height: 300)
                
                Chart(data.consumables) { item in
                    LineMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                }
                .frame(height: 300)
                
                Chart(data.consumables) { item in
                    AreaMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                }
                .frame(height: 300)
                
                Chart(data.consumables) { item in
                    PointMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                }
                .frame(height: 300)
                
                Chart(data.consumables) { item in
                    RectangleMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                }
                .frame(height: 300)
                
                Chart(data.consumables) { item in
                    SectorMark(angle: .value("Calories", item.calories))
                        .foregroundStyle(by: .value("Product category", item.category))
                }
                .frame(height: 300)
                
                Chart(data.consumables) { item in
                    RuleMark(x: .value("Calories", item.calories))
                }
                .frame(height: 300)
            }
        }
    }
}

struct MultiMarks: View {
    
    @State private var data = ApplicationData(
        listOfItems: Consumables.sampleData,
        sales: Product.sampleData
    )
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Chart(data.consumables) { item in
                    LineMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                        .interpolationMethod(.catmullRom)
                    
                    PointMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                        .foregroundStyle(by: .value("Category", item.category))
                        .symbol(by: .value("Category", item.category))
                        .symbolSize(200)
                }
                .frame(height: 300)
                
                Chart {
                    ForEach(data.consumables) { item in
                        BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                            .foregroundStyle(.cyan)
                            .opacity(0.8)
                            .cornerRadius(20)
                    }
                    
                    RuleMark(y: .value("Average", averageCalories()))
                        .foregroundStyle(.black)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                        .annotation(position: .top, alignment: .leading) {
                            Text("Average: \(averageCalories())")
                                .bold()
                        }
                }
                .frame(height: 300)
                
                Chart {
                    ForEach(data.sales) { product in
                        ForEach(product.sales) { sale in
                            LineMark(
                                x: .value("Date", sale.date, unit: .day),
                                y: .value("Sales", sale.amount)
                            )
                        }
                        .foregroundStyle(by: .value("Products", product.name))
                    }
                }
                .frame(height: 300)
                
                Chart {
                    ForEach(data.sales) { product in
                        ForEach(product.sales) { sale in
                            BarMark(
                                x: .value("Date", sale.date, unit: .day),
                                y: .value("Sales", sale.amount)
                            )
                        }
                        .foregroundStyle(by: .value("Products", product.name))
                    }
                }
                .chartForegroundStyleScale([
                    "Bagels": .red,
                    "Brownies": .orange
                ])
                .frame(height: 300)
                
                Chart {
                    ForEach(data.sales) { product in
                        ForEach(product.sales) { sale in
                            BarMark(
                                x: .value("Date", sale.date, unit: .day),
                                y: .value("Sales", sale.amount)
                            )
                        }
                        .foregroundStyle(by: .value("Products", product.name))
                        .position(by: .value("Products", product.name))
                    }
                }
                .frame(height: 300)
            }
            .padding()
        }
    }
    
    func averageCalories() -> Int {
        let total = data.consumables.reduce(0) { $0 + $1.calories }
        return total / data.consumables.count
    }
}

struct ScrollableMarks: View {
    
    @State private var data = ApplicationData(
        listOfItems: Consumables.sampleData,
        sales: Product.sampleData
    )
    
    var body: some View {
        VStack(spacing: 30) {
            Chart {
                ForEach(data.sales) { product in
                    ForEach(product.sales) { sale in
                        BarMark(
                            x: .value("Date", sale.date, unit: .day),
                            y: .value("Sales", sale.amount)
                        )
                    }
                    .foregroundStyle(by: .value("Products", product.name))
                    .position(by: .value("Products", product.name))
                }
            }
            .frame(height: 300)
            .chartLegend(.hidden)
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 3600 * 24 * 4)
        }
        .padding()
    }
}

#Preview {
    Marks()
}

#Preview("Multi Marks") {
    MultiMarks()
}

#Preview("Scrollable Marks") {
    ScrollableMarks()
}
