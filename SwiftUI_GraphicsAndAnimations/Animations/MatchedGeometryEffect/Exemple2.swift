//
//  Exemple2.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 18/06/2025.
//

import SwiftUI

struct Exemple2: View {
    
    @Namespace private var namespace
    @State private var isPresented: Bool = false
    
    let ingredient = Ingredient.allCases[0]
    
    var body: some View {
        VStack {
            Button("Present") {
                withAnimation(Animation.spring(response: 0.45, dampingFraction: 0.9)) {
                    self.isPresented.toggle()
                }
            }
            
            Spacer()
            
            /**
             Here both views are displayed at the same time.
             - To avoid rendering both views at the same time, we must correctly set the isSource parameter in the matchedGeometryEffect modifier.
             - For the transition to work properly, both views need to originate from the same initial state. The new view can then animate from the first state to the second. This is represented by "style: isPresented ? .card : .thumbnail".
             
             - Please note that the card view is still present above the thumbnail view. That means that onTapGesture on the thumbnail view will not work.
             */
            
            ZStack {
                IngredientView(
                    ingredient: ingredient,
                    style: .thumbnail
                )
                .matchedGeometryEffect(id: ingredient.id, in: namespace, isSource: !isPresented)
                .frame(width: 180, height: 180)
                .onTapGesture {
                    // Unfortunately this does not work.
                    print("Thumbnail view has been tapped")
                }
                
                IngredientView(
                    ingredient: ingredient,
                    style: isPresented ? .card : .thumbnail
                )
                .matchedGeometryEffect(id: ingredient.id, in: namespace, isSource: isPresented)
                .aspectRatio(0.75, contentMode: .fit)
                .frame(width: 500, height: 600)
                .onTapGesture {
                    print("Cart view has been tapped")
                }
            }
        }
    }
}

#Preview {
    Exemple2()
}
