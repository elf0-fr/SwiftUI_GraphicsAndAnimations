//
//  Path.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        VStack(spacing: 0) {
            Path { path in
                path.move(to: .init(x: 100, y: 50))
                path.addLine(to: .init(x: 200, y: 50))
                path.addLine(to: .init(x: 100, y: 150))
                path.closeSubpath() // Comment this line to have an opened path.
            }
            .stroke(Color.red, lineWidth: 5)
            
            Path { path in
                path.move(to: .init(x: 100, y: 50))
                path.addLine(to: .init(x: 200, y: 50))
                path.addArc(
                    center: .init(x: 200, y: 70), // y = 70 = 50 + 20 because radius = 20
                    radius: 20,
                    startAngle: .degrees(270),
                    endAngle: .degrees(90),
                    clockwise: false
                ) // 90° is at the bottom.
                path.addLine(to: .init(x: 100, y: 90))
            }
            .stroke(Color.red, lineWidth: 5)
            
            Path { path in
                path.move(to: .init(x: 100, y: 50))
                path.addLine(to: .init(x: 200, y: 50))
                path.addEllipse(in: .init(x: 200, y: 40, width: 20, height: 20))
                path.addLine(to: .init(x: 320, y: 50))
            }
            .stroke(Color.red, lineWidth: 5)
            
            Path { path in
                path.move(to: .init(x: 100, y: 50))
                path.addQuadCurve(
                    to: .init(x: 100, y: 150),
                    control: .init(x: 150, y: 100)
                )
                
                path.move(to: .init(x: 200, y: 50))
                path.addCurve(
                    to: .init(x: 200, y: 150),
                    control1: .init(x: 250, y: 80),
                    control2: .init(x: 150, y: 120)
                )
            }
            .stroke(Color.red, lineWidth: 5)
        }
    }
}

struct PathWithGeometryReader: View {
    
    @State private var size: CGFloat = 150
    
    var body: some View {
        VStack {
            GroupBox {
                LabeledContent {
                    Slider(value: $size, in: 100...500)
                } label: {
                    let sizeInDouble = Double(size)
                    Text("Size: \(sizeInDouble.formatted(.number.precision(.fractionLength(0))))")
                        .frame(width: 100, alignment: .leading)
                }
            }
            
            GeometryReader { geometry in
                Path { path in
                    let width = geometry.size.width / 2
                    let height = width
                    let posX = (geometry.size.width - width) / 2
                    let posY = (geometry.size.height - height) / 2
                    
                    path.move(to: CGPoint(x: posX, y: posY))
                    path.addLine(to: .init(x: posX + width, y: posY))
                    path.addLine(to: .init(x: posX, y: posY + height))
                    path.closeSubpath()
                }
                .stroke(.blue, lineWidth: 5)
            }
            .frame(width: size, height: size)
        }
    }
}

#Preview {
    PathView()
}

#Preview("With GeometryReader") {
    PathWithGeometryReader()
}
