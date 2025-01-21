//
//  Selection.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI
import Charts

struct Selection: View {
    
    @State private var data = ApplicationData(
        listOfItems: Consumables.sampleData,
        sales: Product.sampleData
    )
    @State private var selectedFool: String?
    
    var body: some View {
        Chart(data.consumables) { item in
            BarMark(x: .value("Name", item.name), y: .value("Calories", item.calories))
                .foregroundStyle(item.name == selectedFool ? .yellow : .blue)
        }
        .frame(height: 300)
        .padding()
        .chartXSelection(value: $selectedFool)
    }
}

#Preview {
    Selection()
}
