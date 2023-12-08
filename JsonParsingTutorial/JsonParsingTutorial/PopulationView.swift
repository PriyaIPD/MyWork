//
//  PopulationView.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-06.
//

import SwiftUI

struct PopulationView: View {
    var body: some View {
        VStack{
            
        }
        .onAppear(perform: {
            WebService.shared.fetchPopulation { populationInfo in
                print("Population is", populationInfo)
            }
        })
    }
}

