//
//  LandscapeGreetingsView.swift
//  Greetings
//
//  Created by Ron Erez on 21/09/2023.
//

import SwiftUI

struct LandscapeGreetingsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            HStack {
                VerticalTitleView()
                
                Spacer()
                
                MessagesView()
                
            }
            .padding()
        }
    }
}

#Preview {
    LandscapeGreetingsView()
}
