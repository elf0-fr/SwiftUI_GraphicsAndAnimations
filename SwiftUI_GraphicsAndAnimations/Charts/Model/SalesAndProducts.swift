//
//  SalesAndProducts.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 20/01/2025.
//

import Foundation

struct Sales: Identifiable {
    let id: UUID = UUID()
    var date: Date
    var amount: Int
}

struct Product: Identifiable {
    let id: UUID = UUID()
    var name: String
    var sales: [Sales]
}

extension Sales {
    static var sampleDataBagels: [Sales] = [
        Sales(date: Date(timeInterval: -86400 * 7, since: Date()), amount: 10),
        Sales(date: Date(timeInterval: -86400 * 6, since: Date()), amount: 12),
        Sales(date: Date(timeInterval: -86400 * 5, since: Date()), amount: 8),
        Sales(date: Date(timeInterval: -86400 * 4, since: Date()), amount: 5),
        Sales(date: Date(timeInterval: -86400 * 3, since: Date()), amount: 10),
        Sales(date: Date(timeInterval: -86400 * 2, since: Date()), amount: 15),
        Sales(date: Date(timeInterval: -86400 * 1, since: Date()), amount: 8),
    ]
    
    static var sampleDataBrownies: [Sales] = [
        Sales(date: Date(timeInterval: -86400 * 7, since: Date()), amount: 3),
        Sales(date: Date(timeInterval: -86400 * 6, since: Date()), amount: 2),
        Sales(date: Date(timeInterval: -86400 * 5, since: Date()), amount: 8),
        Sales(date: Date(timeInterval: -86400 * 4, since: Date()), amount: 5),
        Sales(date: Date(timeInterval: -86400 * 3, since: Date()), amount: 9),
        Sales(date: Date(timeInterval: -86400 * 2, since: Date()), amount: 4),
        Sales(date: Date(timeInterval: -86400 * 1, since: Date()), amount: 8),
    ]
}

extension Product {
    static var sampleData: [Product] = [
        .init(name: "Bagels", sales: Sales.sampleDataBagels),
        .init(name: "Brownies", sales: Sales.sampleDataBrownies),
    ]
}
