//
//  Exemple5.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 18/06/2025.
//

import SwiftUI

struct Exemple5: View {
    
    @Namespace private var namespace
    
    @State private var selectedIngredient: Ingredient.ID?
    
    let columns = [
        GridItem(.adaptive(minimum: 130), spacing: 16, alignment: .top)
    ]
    
    var body: some View {
        VStack {
            /**
             This exemple shows that matchedGeometryEffect and NavigationStack do not work together.
             */
            
            RoundedRectangle(cornerRadius: 5)
                .fill(.blue)
                .padding()
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                ForEach(Ingredient.allCases) { ingredient in
                    
                    IngredientView(
                        ingredient: ingredient,
                        style: .thumbnail
                    )
                    .matchedGeometryEffect(
                        id: ingredient.id,
                        in: namespace
                    )
                    .aspectRatio(1, contentMode: .fit)
                    .onTapGesture {
                        withAnimation {
                            selectedIngredient = ingredient.id                            
                        }
                    }
                }
            }
            .padding()
            .navigationDestination(item: $selectedIngredient) { id in
                let ingredient = Ingredient.allCases.first(where: { $0.id == id })!
                IngredientView(
                    ingredient: ingredient,
                    style: .card
                )
                .matchedGeometryEffect(
                    id: id,
                    in: namespace
                )
                .aspectRatio(0.75, contentMode: .fit)
            }
        }
    }
}

#Preview {
    NavigationStack {
        Exemple5()
    }
}
