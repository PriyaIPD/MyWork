//
//  PopulationDTO.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-06.
//

import UIKit

struct PopulationDTO: Codable {
    var data : [Data]
    var source : [Source]

}
struct Data: Codable {
    var nation : String
    var year : String
    var population : Int
    var slugNation : String

    enum CodingKeys: String, CodingKey {
        case nation = "Nation"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
    
}

struct Source: Codable {
    var name : String
    var annotations : Annotations
}

struct Annotations : Codable{
    var name : String
    var description : String
    var datasetName : String
    var topic : String
    
    enum CodingKeys: String, CodingKey {
        case name = "source_name"
        case description = "source_description"
        case datasetName = "dataset_name"
        case topic = "subtopic"

    }
}
