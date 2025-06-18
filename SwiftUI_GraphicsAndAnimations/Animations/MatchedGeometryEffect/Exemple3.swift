//
//  Exemple3.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 18/06/2025.
//

import SwiftUI

struct Exemple3: View {
    @Namespace private var namespace
    @State private var isCardPresented: Bool = false
    
    let ingredient = Ingredient.allCases[0]
    
    var body: some View {
        VStack {
            Button("Present") {
                withAnimation(Animation.spring(response: 0.45, dampingFraction: 0.9)) {
                    self.isCardPresented.toggle()
                }
            }
            
            Spacer()
            
            /**
             Here matchedGeometryEffect is applied to subViews.
             - For the transition to work properly, we must share the same namespace between those two subviews.
             */
            
            ZStack {
                ThumbnailView(
                    ingredient: ingredient,
                    isPresented: !isCardPresented,
                    namespace: namespace
                )
                
                CardView(
                    ingredient: ingredient,
                    isPresented: isCardPresented,
                    namespace: namespace
                )
            }
        }
    }
}

#Preview {
    Exemple3()
}

struct ThumbnailView: View {
    
    let ingredient: Ingredient
    let isPresented: Bool
    let namespace: Namespace.ID
    
    var body: some View {
        IngredientView(
            ingredient: ingredient,
            style: .thumbnail
        )
        .matchedGeometryEffect(id: ingredient.id, in: namespace, isSource: isPresented)
        .frame(width: 180, height: 180)
    }
}

struct CardView: View {
    
    let ingredient: Ingredient
    let isPresented: Bool
    let namespace: Namespace.ID
    
    var body: some View {
        IngredientView(
            ingredient: ingredient,
            style: isPresented ? .card : .thumbnail
        )
        .matchedGeometryEffect(id: ingredient.id, in: namespace, isSource: isPresented)
        .aspectRatio(0.75, contentMode: .fit)
        .frame(width: 500, height: 600)
    }
}
