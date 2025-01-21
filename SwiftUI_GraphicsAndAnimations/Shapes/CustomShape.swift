//
//  CustomShape.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI

struct CustomShape: View {
    var body: some View {
        Triangle()
            .stroke(.green, lineWidth: 5)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width / 2
            let height = width
            let posX = (rect.width - width) / 2
            let posY = (rect.height - height) / 2
            
            path.move(to: CGPoint(x: posX, y: posY))
            path.addLine(to: .init(x: posX + width, y: posY))
            path.addLine(to: .init(x: posX, y: posY + height))
            path.closeSubpath()
        }
    }
}

#Preview {
    CustomShape()
}
