//
//  Exemple4.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 18/06/2025.
//

import SwiftUI

struct Exemple4: View {
    
    @Namespace private var namespace
    
    @State private var selectedIngredient: Ingredient.ID?
    
    let columns = [
        GridItem(.adaptive(minimum: 130), spacing: 16, alignment: .top)
    ]
    
    var body: some View {
        VStack {
            /**
             Here we have a collection of ingredients.
             */
            
            ZStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.blue)
                        .padding()
                    
                    LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                        ForEach(Ingredient.allCases) { ingredient in
                            let isPresented = selectedIngredient == ingredient.id
                            IngredientView(
                                ingredient: ingredient,
                                style: isPresented ? .card : .thumbnail
                            )
                            .matchedGeometryEffect(
                                id: ingredient.id,
                                in: namespace,
                                isSource: !isPresented
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
                }
                
                if let _ = selectedIngredient {
                    Rectangle().fill(.regularMaterial).ignoresSafeArea()
                }
                
                ForEach(Ingredient.allCases) { ingredient in
                    let isPresented = selectedIngredient == ingredient.id
                    IngredientView(
                        ingredient: ingredient,
                        style: isPresented ? .card : .thumbnail
                    )
                    .matchedGeometryEffect(id: ingredient.id, in: namespace, isSource: isPresented)
                    .aspectRatio(0.75, contentMode: .fit)
                    .overlay(alignment: .topTrailing) {
                        Button {
                            withAnimation {
                                selectedIngredient = nil
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .blendMode(.overlay)
                        }
                        .buttonStyle(.plain)
                        .padding()
                    }
                    .opacity(isPresented ? 1 : 0)
                }
            }
        }
    }
}

#Preview {
    Exemple4()
}
