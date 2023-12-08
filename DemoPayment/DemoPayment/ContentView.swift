//
//  ContentView.swift
//  DemoPayment
//
//  Created by Priya Gandhi on 2023-12-07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("create");
        }
        .onAppear(perform: {
            WebServices.shared.createQRCode()
        })
    }
}


