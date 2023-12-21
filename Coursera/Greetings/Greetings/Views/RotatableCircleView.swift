//
//  RotatableCircleView.swift
//  Greetings
//
//  Created by Ron Erez on 21/09/2023.
//

import SwiftUI

struct RotatableCircleView: View {
    let lineWidth = 15.0
    let diameter = 70.0

    @State private var isRotated: Bool = false
    
    var angle: Angle {
        isRotated ? .zero : Angle(degrees: 360)
    }
    var angularGradient: AngularGradient {
        AngularGradient.init(gradient: Gradient(colors: [
            .pink, .purple, .blue, .orange, .yellow]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, angle: .zero)
    }
    var body: some View {
        Circle()
            .strokeBorder( angularGradient,
                           lineWidth: lineWidth)
            .rotationEffect( angle)
            .frame(width: diameter, height: diameter)
            .onTapGesture {
                withAnimation {
                    isRotated.toggle()
                }
            }
    }
}

#Preview {
    RotatableCircleView()
}
