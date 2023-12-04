//
//  HomeModel.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-04.
//

import Foundation
struct HomeModel: Codable {
    var squadName : String
    var homeTown : String
    var formed : Int
    var secretBase : String
    var active : Bool
    var members : [Members]
}

struct Members: Codable {
    var gender : String
    var name : String
    var eyeColor : String
    var age : Int
    var index : Int
    var isActive : Bool
}

