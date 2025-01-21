//
//  SFSymbol.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 21/01/2025.
//

import SwiftUI

struct SFSymbol: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 50) {
            Image(systemName: "wifi")
                .font(.largeTitle)
                .symbolEffect(.variableColor.iterative, value: isActive)
            
            Image(systemName: "wifi")
                .font(.largeTitle)
                .symbolEffect(.pulse.byLayer, options: .nonRepeating, value: isActive)
            
            Image(systemName: "wifi")
                .font(.largeTitle)
                .symbolEffect(.bounce, options: .repeat(.periodic).speed(0.7), value: isActive)
            
            Image(systemName: "wifi")
                .font(.largeTitle)
                .symbolEffect(.scale.up, isActive: isActive)
            
            if isActive {
                Image(systemName: "wifi")
                    .font(.largeTitle)
                    .transition(.symbolEffect(.disappear))
            }
            
            Button("Tap me") {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    SFSymbol()
}
