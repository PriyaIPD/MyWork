//
//  ContentView.swift
//  EasyShopper
//
//  Created by Priya Gandhi on 2023-12-07.
//

import SwiftUI
let aspect = 1.5

struct ContentView: View {
    
    @State var shoppingList : [String: ShoppingList]
    @State var sum : Int?

    var body: some View {
        VStack {
            Text("Shopping Items")
                .font(.system(size: 30))
            ForEach(Array(shoppingList.values), id: \.id) { cha in
                List {
                    HStack{
                        AsyncImage(
                            url: URL(string: cha.image_url),
                            transaction: .init(animation: .easeIn(duration: 3)) // <- slow animation to show issue
                        ) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(aspect, contentMode: .fill)
                                    .clipped()
                                    .cornerRadius(12.0)
                                
                            default:
                                Image(systemName: "rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(aspect, contentMode: .fill)
                                    .clipped()
                                    .foregroundColor(.white)
                            }
                        }
                        .aspectRatio(aspect, contentMode: .fit)
                        
                        Text(cha.name)
                    }.frame(height: 80)
                }
                }.environment(\.defaultMinListRowHeight, 10)
                    
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Text("Total Amount: $\(sum ?? 0)")

                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .textSelection(.enabled)
            }
            
        }
            .onAppear(perform: {
                WebService.shared.fetchItems { data, sume in
                    self.shoppingList = data
                    self.sum = sume ?? 0
                    
                }
            })
        
    }
}



