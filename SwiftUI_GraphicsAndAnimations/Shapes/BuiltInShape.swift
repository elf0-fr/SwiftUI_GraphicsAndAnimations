//
//  BuiltInShape.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI

struct BuiltInShape: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 100, height: 100)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
            Circle()
                .frame(width: 100, height: 100)
            Capsule()
                .frame(width: 100, height: 50)
            Ellipse()
                .frame(width: 100, height: 50)
        }
        .padding()
    }
}

struct ShapeRoundedRectangle: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .frame(width: 100, height: 100)
        }
        .padding()
    }
}

struct ShapeCapsule: View {
    var body: some View {
        VStack {
            Capsule()
                .frame(width: 100, height: 50)
            
            Capsule(style: .circular)
                .frame(width: 100, height: 50)
        }
        .padding()
    }
}

struct ShapeStyle: View {
    var body: some View {
        VStack {
            Circle()
                .fill(.yellow)
                .stroke(.blue, lineWidth: 5)
                .strokeBorder(.red, lineWidth: 5)
                .frame(width: 100, height: 100)
            
            Circle()
                .stroke(.yellow, lineWidth: 5)
                .strokeBorder(.red, lineWidth: 5)
                .frame(width: 100, height: 100)
                .padding(5)
//                .background {
//                    Rectangle()
//                        .fill(.indigo)
//                }
                .background(.indigo, in: Rectangle()) // It is the same as above.
            
            let lineStyle = StrokeStyle(
                lineWidth: 10,
                lineCap: .butt,
                lineJoin: .round,
                miterLimit: 0,
                dash: [20],
                dashPhase: 0
            )
            Circle()
                .stroke(style: lineStyle)
                .frame(width: 100, height: 100)
        }
        .padding()
    }
}

#Preview {
    BuiltInShape()
}

#Preview("Rounded Rectangle") {
    ShapeRoundedRectangle()
}

#Preview("Capule") {
    ShapeCapsule()
}

#Preview("Style") {
    ShapeStyle()
}
