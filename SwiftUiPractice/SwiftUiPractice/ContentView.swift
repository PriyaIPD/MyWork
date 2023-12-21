//
//  ContentView.swift
//  SwiftUiPractice
//
//  Created by Priya Gandhi on 2023-12-12.
//

import SwiftUI

struct ContentView: View {
    let colorList1 : [Color] = [.red, .mint, .orange]
    let colorList2 : [Color] = [.black, .green, .gray]
    @State  var textOffset : CGFloat = -300.0
    @State  var isScreenTapped : Bool = true
    
    var body: some View {
        ZStack{
            LinearGradient(colors: isScreenTapped ? colorList1 : colorList2 , startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .opacity(0.8)
            Text(isScreenTapped ? "Basics of Swift UI ": "Advance Concepts if you know everything")
                 .font(.largeTitle)
                 .foregroundStyle(.red)
                 .opacity(0.9)
                 .fontWeight(.bold)
                 .offset(y: textOffset)
                 .multilineTextAlignment(.center)
                 .padding()
        }
        .onTapGesture {
            isScreenTapped.toggle()
            withAnimation(.easeIn(duration: 0.5)) {
                if isScreenTapped{
                    textOffset = 0.0
                }else{
                    textOffset = -200.0
                }
            }
        }
          

    }
}

#Preview {
    ContentView()
}
