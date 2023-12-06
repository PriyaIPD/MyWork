//
//  FactsView.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-05.
//

import SwiftUI

struct FactsView: View {
    var body: some View {
        VStack{
        }
        .onAppear(perform: {
            WebService.shared.fetchFacts { factsInfo in
                print("facts dats", factsInfo!)
            }
    })
        }
           }

