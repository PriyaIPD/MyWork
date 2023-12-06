//
//  CoinsView.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-06.
//

import SwiftUI

struct CoinsView: View {
    var body: some View {
        VStack{
        }
        .onAppear(perform: {
            WebService.shared.fetchCoinInfo { coinInfo in
                print("coinInfo ", coinInfo?.disclaimer)
            }
        })
    }
}


