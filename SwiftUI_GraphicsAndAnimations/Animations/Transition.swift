//
//  Transition.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 20/01/2025.
//

import SwiftUI

struct Transition: View {
    
    @State private var showText: Bool = false
    
    var body: some View {
        VStack {
            Button(showText ? "Hide text" : "Show text") {
                withAnimation {
                    showText.toggle()
                }
            }
            
            if (showText) {
                Text("Hello, World!")
                    .transition(.scale.animation(.bouncy))
                
                Text("Combined Animation!")
                    .transition(.scale.combined(with: .slide))

                Text("My custom transition!")
                    .transition(.myTransition)
                
                Text("Asymmetric Animation!")
                    .transition(
                        .asymmetric(
                            insertion: .push(from: .trailing).animation(.default.speed(0.3)),
                            removal: .opacity
                        )
                    )
            }
            
            Spacer()
        }
    }
}

extension AnyTransition {
    static var myTransition: AnyTransition {
        let animation = Animation.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)
        let transition = AnyTransition.opacity.animation(animation)
        return transition
    }
}

struct MatchGeometryEffect: View {
    
    @Namespace private var myAnimation
    @State private var showText: Bool = false
    
    var body: some View {
        VStack {
            Button("Toggle animation") {
                withAnimation {
                    showText.toggle()
                }
            }
            
            HStack {
                if (showText) {
                    Text("Left Text")
                        .matchedGeometryEffect(id: "TextAnimation", in: myAnimation)
                }
                
                Spacer()
                
                if (!showText) {
                    Text("Right Text")
                        .matchedGeometryEffect(id: "TextAnimation", in: myAnimation)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    Transition()
}

#Preview("MatchGeometryEffect") {
    MatchGeometryEffect()
}
