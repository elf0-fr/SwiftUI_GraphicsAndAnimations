//
//  Transformations.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI

struct TransformationsOffset: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(Color.blue)
            .frame(width: 200, height: 100)
            .offset(x: 100, y: 100)
    }
}

struct TransformationsScale: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.blue)
                .frame(width: 200, height: 100)
                .scaleEffect(0.5, anchor: .bottom)
            
            RoundedRectangle(cornerRadius: 5)
                .scale(0.3, anchor: .leading)
                .fill(Color.blue)
                .frame(width: 200, height: 100)
        }
    }
}

struct TransformationRotation: View {
    
    @State private var rotationAngle: Double = 45
    
    var body: some View {
        VStack {
            GroupBox {
                Slider.init(value: $rotationAngle, in: 0...360) {
                    Text("Rotation")
                } minimumValueLabel: {
                    Text("\(0)")
                } maximumValueLabel: {
                    Text("\(360)")
                }
            }
            
            VStack(spacing: 130) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(width: 100, height: 50)
                    .rotationEffect(.degrees(rotationAngle), anchor: .bottomLeading)
                
                RoundedRectangle(cornerRadius: 5)
                    .rotation(.degrees(rotationAngle), anchor: .top)
                    .fill(Color.blue)
                    .frame(width: 100, height: 50)
   
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(width: 100, height: 50)
                    .rotation3DEffect(.degrees(rotationAngle), axis: (x: 0, y: 1, z: 0))
            }
            
        }
    }
}

#Preview("Offset") {
    TransformationsOffset()
}

#Preview("Scale") {
    TransformationsScale()
}

#Preview("Rotation") {
    TransformationRotation()
}
