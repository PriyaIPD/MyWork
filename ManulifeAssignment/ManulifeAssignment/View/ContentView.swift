//
//  ContentView.swift
//  ManulifeAssignment
//
//  Created by Priya Gandhi on 2023-11-28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let obj = PreferenceManager.shared.get(forKey: .Account)
        if obj.isEmpty == false{
            //AccountView()
            MainContentView()

        }else{
            MainContentView()

        }
    }
}

struct MainContentView: View {
        @State private var readyToNavigate : Bool = false
    @ObservedObject private var viewModel = AccountsVM()

    var body: some View{
        NavigationStack {
            ZStack {
                Rectangle()
                    .fill(Gradient(colors: [.indigo, .purple]))
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Button {
                        readyToNavigate = true
                        viewModel.getTransactionHistory1()
                    } label: {
                        Text("Open")
                            .frame(width: 200 , height: 40, alignment: .center)
                    } .padding()
                        .background(Color.black)
                        .cornerRadius(12.0)
                        .foregroundColor(Color.white)
                        .frame(alignment: .bottom)
                }
            }
            .navigationTitle("")
            .navigationDestination(isPresented: $readyToNavigate) {
                AccountView()
                
            }
            
        }
    }
}


