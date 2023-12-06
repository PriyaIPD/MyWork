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
                CoinsView()
            } else {
                Button("Users List") {
                    self.showLoginView = true
                }
            }
        }
    }
}

struct UsersView: View {
    var vm = UserViewModel()
    @State var users : [Users] = []
    var body: some View {
        NavigationView{
            VStack {
                Text("User's List ❤️").font(.headline)
                
                List {
                    ForEach(users, id: \.phoneNumber ) { a in
                        
                        Text(a.emailAddress)
                        NavigationLink(destination: HomeView()) {
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            }.onAppear(perform: {
                vm.getUserList { user in
                    self.users = user
                }
            })
       
    }
}


struct HomeView: View {
    var vm = UserViewModel()
    @State var member : [Members] = []
    var body: some View {
        NavigationView{
            VStack {
                Text("User's List ❤️").font(.headline)
                
                List {
                    ForEach(member, id: \.index ) { a in
                        Section(header: Text("Name: \(a.name)")) {
                            Text("Color: \(a.eyeColor.localizedCapitalized)")
                            Text("Gender: \(a.gender.localizedCapitalized)")
                            Text("Age: \(a.age)")
                        }
                        NavigationLink(destination: GlossaryView()) {
                        }

                    }
                }  
                .background(Color.mint)

                .listStyle(InsetGroupedListStyle())
            }
            }.onAppear(perform: {
                vm.getList { user in
                    self.member = user
                }
            })
       
    }

}
