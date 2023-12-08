//
//  ContentView.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-01.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        MasterView()
    }
}

struct MasterView: View {
    @State var showLoginView: Bool = false

    var body: some View {
        VStack {
            if showLoginView {
                PopulationView()
            } else {
                Button("Users List") {
                    self.showLoginView = true
                }
            }
        }
    }
}



