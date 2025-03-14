//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Priya Gandhi on 2025-03-14.
//

import SwiftUI
import MapKit
struct ContentView: View {
    var landmark: LandmarkModel
    var body: some View {
        VStack {
            Map(initialPosition: .region(region))
                .frame(height: 300)
            landmark.image
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .offset(y: -100)
                .padding(.bottom, -100)
            VStack{
                Text(landmark.name)
                    .font(.title)
                HStack{
                    Text(landmark.state)
                    Spacer()
                    Text(landmark.description)
                }
                
                
            }
            
            Divider()
            Text(landmark.state)
                .font(.title2)
        }
        .padding()
    }
     var region =
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    
    
}

#Preview {
    ContentView(landmark: landmarks[0])
}
