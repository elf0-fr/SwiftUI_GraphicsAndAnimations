//
//  Consumables.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import Foundation

struct Consumables: Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var calories: Int
}

extension Consumables {
    static let sampleData: [Consumables] = [
        .init(
            name: "Apple",
            category: "Fruit",
            calories: 95
        ),
        .init(
            name: "Banana",
            category: "Fruit",
            calories: 105
        ),
        .init(
            name: "Pasta",
            category: "Meal",
            calories: 62
        ),
        .init(
            name: "Carrot",
            category: "Vegetable",
            calories: 84
        ),
        .init(
            name: "Cucumber",
            category: "Vegetable",
            calories: 4
        )
    ]
}
