//
//  TextView.swift
//  SwiftUiPractice
//
//  Created by Priya Gandhi on 2023-12-12.
//

import SwiftUI

struct TextView: View {
    let text : String
    @State  var color : Color
    var colors : [Color] = [.red, .green, .indigo, .accentColor, .pink]
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.semibold)
            .padding()
            .foregroundStyle(.white)
            .background(color)
            .cornerRadius(18.0)
            .opacity(0.8)
            .onTapGesture {
                withAnimation {
                    color = colors.randomElement() ?? .red
                }
            }
    }
}

