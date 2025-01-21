//
//  Effects.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI

struct Effects: View {
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 20)
            // foregroundStyle works the same as fill but fill is more efficient with shapes.
                .foregroundStyle(.red.shadow(.drop(color: .green, radius: 3, x: 4, y: 4)))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.red.shadow(.drop(color: .green, radius: 3, x: 4, y: 4)))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.red.opacity(0.4))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.red.blendMode(.exclusion)) // There are a lot of blend mode.
                .padding()
                .background(.blue, in: Rectangle())
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.image(Image(systemName: "pencil")))
        }
        .frame(width: 100, height: 100)
    }
}

struct EffectsClipShapeAndTrim: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.blue)
                .frame(width: 200, height: 100)
                .clipShape(Triangle())
            
            RoundedRectangle(cornerRadius: 5)
                .trim(from: 0, to: 0.5)
                .fill(Color.blue)
                .frame(width: 200, height: 100)
        }
    }
}

#Preview {
    Effects()
}

#Preview("Clip Shape and Trim") {
    EffectsClipShapeAndTrim()
}
