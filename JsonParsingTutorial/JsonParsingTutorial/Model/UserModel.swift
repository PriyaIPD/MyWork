//
//  UserModel.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-01.
//

import UIKit


struct UserModel: Codable{
        var users : [Users]
    }
struct Users: Codable{
           // var userId : Int
        var firstName : String
        var lastName : String
        var phoneNumber : String
        var emailAddress : String
    }
