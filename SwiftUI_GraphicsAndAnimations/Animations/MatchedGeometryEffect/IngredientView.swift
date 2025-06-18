//
//  IngredientView.swift
//  SwiftUI_GraphicsAndAnimations
//
//  Created by Elfo on 18/06/2025.
//
// A simplified version of the IngredientGraphic view of the Apple's Fruta app.

import SwiftUI

struct IngredientView: View {
    
    enum Style {
        case thumbnail
        case card
    }
    
    struct AnimatableFontModifier: ViewModifier, Animatable {
        var size: Double
        var weight: Font.Weight = .regular
        var design: Font.Design = .default
        
        var animatableData: Double {
            get { size }
            set { size = newValue }
        }
        
        func body(content: Content) -> some View {
            content
                .font(.system(size: size, weight: weight, design: design))
        }
    }
    
    
    let ingredient: Ingredient
    let style: Style
    
    let shape = RoundedRectangle(cornerRadius: 16, style: .continuous)
    
    var body: some View {
        ZStack {
            image
            
            title
        }
        .frame(minWidth: 130, maxWidth: 400, maxHeight: 500)
        .compositingGroup()
        .clipShape(shape)
        .overlay {
            shape
                .inset(by: 0.5)
                .stroke(.quaternary, lineWidth: 0.5)
        }
        .contentShape(shape)
    }
    
    var title: some View {
        Text(ingredient.name.uppercased())
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .lineLimit(2)
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
            .rotationEffect(style == .thumbnail ? .degrees(0) : .degrees(-90))
            .opacity(0.9)
            .blendMode(.overlay)
            .animatableFont(size: style == .thumbnail ? 40 : 50, weight: .bold)
            .minimumScaleFactor(0.25)
            .offset(style == .card ? CGSize(width: -160, height: 0) : .zero)
            
    }
    
    var image: some View {
        GeometryReader { geo in
            Image(ingredient.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height)
        }
            
    }
}

extension View {
    func animatableFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(IngredientView.AnimatableFontModifier(size: size, weight: weight, design: design))
    }
}

#Preview {
    VStack {
        IngredientView(
            ingredient: .allCases[0],
            style: .thumbnail
        )
        .frame(width: 180, height: 180)
        
        IngredientView(
            ingredient: .allCases[0],
            style: .card
        )
        .aspectRatio(0.75, contentMode: .fit)
        .frame(width: 500, height: 600)
    }
}
