//
//  Exemple1.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 18/06/2025.
//

import SwiftUI

struct Exemple1: View {
    
    @Namespace private var namespace
    @State private var isPresented: Bool = false
    @State private var showCard: Bool = false
    
    let ingredient = Ingredient.allCases[0]
    
    var body: some View {
        VStack {
            Button("Present") {
                withAnimation(
                    .default
//                        .speed(0.2)
                ) {
                    self.isPresented.toggle()
                }
            }
            
            Spacer()
            
            /**
             Here one view transitions to the other.
             - We do not need to set the "isSource" parameter from the matchedGeometryEffect.
             - However, in order for the new view to transition from state 1 to state 2, we must add a new state variable that change when the view appear or disappear.
             */
            
            if !isPresented {
                IngredientView(
                    ingredient: ingredient,
                    style: .thumbnail
                )
                .matchedGeometryEffect(id: ingredient.id, in: namespace)
                .frame(width: 180, height: 180)
            }
            else {
                IngredientView(
                    ingredient: ingredient,
                    style: showCard ? .card : .thumbnail
                )
                .matchedGeometryEffect(id: ingredient.id, in: namespace)
                .aspectRatio(0.75, contentMode: .fit)
                .frame(width: 500, height: 600)
                .onAppear {
                    withAnimation {
                        showCard = true
                    }
                }
                .onDisappear {
                    withAnimation {
                        showCard = false
                    }
                }
            }
        }
    }
}

#Preview {
    Exemple1()
}
