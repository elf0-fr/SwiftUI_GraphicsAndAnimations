//
//  ShapeAnimation.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 20/01/2025.
//

import SwiftUI

struct ShapeAnimation: View {
    @State private var smiling: Bool = true
    
    var body: some View {
        Face(smile: smiling ? 1 : 0)
            .stroke(.blue, lineWidth: 2)
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
                    smiling = false
                }
            }
    }
}

struct Face: Shape {
    
    var smile: CGFloat
    
    var animatableData: CGFloat {
        get { smile }
        set { smile = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let smileClamp = min(max(smile, 0), 1)
            let section = rect.height / 5
            let smilePos = section + (section * 3 * smileClamp)
            
            path.addEllipse(in: .init(x: width / 10 * 2 - 10, y: rect.minY + 10, width: 20, height: 20))
            path.addEllipse(in: .init(x: width / 10 * 8 - 10, y: rect.minY + 10, width: 20, height: 20))
            
            path.move(to: .init(x: width / 10 * 2, y: rect.midY))
            path.addCurve(
                to: .init(x: width / 10 * 8, y: rect.midY),
                control1: .init(x: width / 4, y: smilePos),
                control2: .init(x: width / 4 * 3, y: smilePos)
            )
        }
    }
}

#Preview {
    ShapeAnimation()
}
