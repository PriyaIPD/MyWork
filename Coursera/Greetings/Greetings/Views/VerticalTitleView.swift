//
//  VerticalTitleView.swift
//  Greetings
//
//  Created by Ron Erez on 21/09/2023.
//

import SwiftUI

struct VerticalTitleView: View {
    @State private var subtitle: LocalizedStringKey = "Exploring iOS Programming"
    
    var body: some View {
        VStack(alignment: .leading) {
            GreetingsTextView(subtitle: $subtitle)
            
            RotatableCircleView()
            
            Spacer()
            
        }.padding(.vertical)
    }
}

#Preview {
    VerticalTitleView()
}
