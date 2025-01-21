//
//  ApplicationData.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 20/01/2025.
//

import Foundation

@Observable
class ApplicationData {
    var consumables: [Consumables]
    var sales: [Product]
    
    init(listOfItems: [Consumables], sales: [Product]) {
        self.consumables = listOfItems
        self.sales = sales
    }
}
