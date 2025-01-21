//
//  Animation.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 20/01/2025.
//

import SwiftUI

struct AnimationView: View {
    
    @State private var scale: CGFloat = 1
    
    var body: some View {
        VStack(spacing: 60) {
            Rectangle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .scaleEffect(scale)
                .onTapGesture {
                    withAnimation {
                        self.scale = self.scale == 1
                        ? 2
                        : 1
                    }
                }
            
            Rectangle()
                .fill(.green)
                .frame(width: 50, height: 50)
                .scaleEffect(scale)
                .onTapGesture {
                    withAnimation(.linear) {
                        self.scale = self.scale == 1
                        ? 2
                        : 1
                    }
                }
            
            Rectangle()
                .fill(.orange)
                .frame(width: 50, height: 50)
                .scaleEffect(scale)
                .onTapGesture {
                    let animation = Animation.bouncy
                        .delay(1)
                        .speed(2)
                        .repeatCount(3)
                    
                    withAnimation(animation) {
                        self.scale = self.scale == 1
                        ? 2
                        : 1
                    }
                }
            
            Rectangle()
                .fill(.cyan)
                .frame(width: 50, height: 50)
                .scaleEffect(scale)
                .onTapGesture {
                    let animation = Animation.bouncy
                        .delay(1)
                        .speed(2)
                        .repeatForever()
                    
                    withAnimation(animation) {
                        self.scale = self.scale == 1
                        ? 2
                        : 1
                    }
                }
        }
    }
}

#Preview {
    AnimationView()
}
