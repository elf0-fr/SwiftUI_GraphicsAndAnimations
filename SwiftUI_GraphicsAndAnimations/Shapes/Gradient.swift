//
//  Gradient.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 19/01/2025.
//

import SwiftUI

struct GradientView: View {
    let gradient = Gradient(colors: [.red, .blue])
    
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 20)
                .fill(gradient)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.linearGradient(gradient, startPoint: .leading, endPoint: .trailing))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.conicGradient(gradient, center: .center))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    .angularGradient(
                        gradient,
                        center: .center,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 180)
                    )
                )
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    .radialGradient(
                        gradient,
                        center: .bottomLeading,
                        startRadius: 0,
                        endRadius: 120
                    )
                )
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    .ellipticalGradient(
                        gradient,
                        center: .center,
                        startRadiusFraction: 0,
                        endRadiusFraction: 0.5
                    )
                )
        }
        .frame(width: 100, height: 100)
    }
}

struct AngularGradient: View {
    let gradient = Gradient(colors: [.red, .blue])
    @State private var startAngle = 0.0
    @State private var endAngle = 0.0
    
    var body: some View {
        VStack {
            GroupBox {
                LabeledContent {
                    Slider(value: $startAngle, in: 0...120)
                } label: {
                    Text("Start angle: \(startAngle.formatted(.number.precision(.fractionLength(0))))")
                        .frame(width: 120, alignment: .leading)
                }
                
                LabeledContent {
                    Slider(value: $endAngle, in: 0...360)
                } label: {
                    Text("End angle: \(endAngle.formatted(.number.precision(.fractionLength(0))))")
                        .frame(width: 120, alignment: .leading)
                }
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    .angularGradient(
                        gradient,
                        center: .center,
                        startAngle: Angle(degrees: startAngle),
                        endAngle: Angle(degrees: endAngle)
                    )
                )
                .frame(width: 100, height: 100)
        }
    }
}

struct GradientStops: View {
    let gradient = Gradient(stops: [
        Gradient.Stop(color: .blue, location: 0.0),
        Gradient.Stop(color: .red, location: 0.4),
    ])
    
    var body: some View {
        Group {
            RoundedRectangle(cornerRadius: 20)
                .fill(gradient)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.linearGradient(gradient, startPoint: .leading, endPoint: .trailing))
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.conicGradient(gradient, center: .center))
        }
        .frame(width: 100, height: 100)
    }
}

#Preview {
    GradientView()
}

#Preview("Angular Gradient") {
    AngularGradient()
}

#Preview("Gradient Stops") {
    GradientStops()
}
