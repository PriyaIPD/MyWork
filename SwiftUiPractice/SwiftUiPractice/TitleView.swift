//
//  TitleView.swift
//  SwiftUiPractice
//
//  Created by Priya Gandhi on 2023-12-12.
//

import SwiftUI

/// Add titles for the view
struct TitleView: View {
    var body: some View {
        VStack (spacing: 12){
            Text("Greetings")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .fontDesign(.rounded)
                .fontWeight(.bold)
            
            Text("Introduction of SwiftUI")
                .font(.headline)
                .foregroundColor(.white)
                .fontDesign(.rounded)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    TitleView()
}
