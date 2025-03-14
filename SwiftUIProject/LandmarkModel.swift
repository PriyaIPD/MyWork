//
//  LandmarkModel.swift
//  SwiftUIProject
//
//  Created by Priya Gandhi on 2025-03-14.
//

import Foundation
import SwiftUI
import CoreLocation

struct LandmarkModel: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
     var imageName: String

    var image: Image {
            Image(imageName)
        }
    
     var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }

     struct Coordinates: Hashable, Codable {
         var latitude: Double
         var longitude: Double
     }
}
