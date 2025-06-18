//
//  Ingredient.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 18/06/2025.
//
// A model of an ingredient with its name and image.
// This model is a simplified version of the one included in the Apple's Fruta app.

import Foundation
import SwiftUI

struct Ingredient: Identifiable {
    let id: UUID = UUID()
    let name: String
    let imageName: String
}

extension Ingredient {
    static let allCases: [Ingredient] = [
        .init(name: "Almond milk", imageName: "almond-milk"),
        .init(name: "Avocado", imageName: "avocado"),
        .init(name: "Banana", imageName: "banana")
    ]
}

#Preview {
    let almondMilk = Ingredient.allCases[0]
    VStack {
        Text(almondMilk.name)
        Image(almondMilk.imageName)
    }
}
