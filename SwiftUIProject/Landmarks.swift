//
//  Landmarks.swift
//  SwiftUIProject
//
//  Created by Priya Gandhi on 2025-03-14.
//

import SwiftUI

struct Landmarks: View {
    var body: some View {
        NavigationSplitView {
            List(landmarks, id: \.id) { landmark in
                NavigationLink(destination: ContentView(landmark: landmark)) {
                    HStack {
                        landmark.image
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(landmark.name)
                            .bold()
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    Landmarks()
}
