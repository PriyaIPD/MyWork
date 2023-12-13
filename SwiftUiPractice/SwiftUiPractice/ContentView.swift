//
//  ContentView.swift
//  SwiftUiPractice
//
//  Created by Priya Gandhi on 2023-12-12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.red,.blue,.green, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                Spacer()
                TitleView()
                Spacer()
                MessageView()
                Spacer()
                Spacer()
            }
           
           

        }
    }
}

#Preview {
    ContentView()
}
