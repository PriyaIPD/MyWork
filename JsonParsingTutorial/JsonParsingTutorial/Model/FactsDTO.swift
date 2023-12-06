//
//  FactsDTO.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-05.
//

import Foundation

struct Facts: Codable {
    var _id : String
    var user : String
    var text : String
    var updatedAt : String
    
 
}
struct Status: Codable {
    var verified : Bool
    var sentCount : Int

  
}
