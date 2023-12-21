//
//  MessageView.swift
//  SwiftUiPractice
//
//  Created by Priya Gandhi on 2023-12-12.
//

import SwiftUI

struct MessageView: View {
    var msgInfo : [Messages] = [Messages(title: "Abhinav Harar", color: .myGreen), Messages(title: "Priya Gandhi", color: .yellow)]

    var body: some View {
        VStack(alignment: .listRowSeparatorLeading, spacing: 22){
            ForEach (msgInfo) { dataItem in
                TextView(text: dataItem.title, color: dataItem.color)

            }
        }    }
}

#Preview {
    MessageView()
}
