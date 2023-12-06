//
//  CoinDTO.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-06.
//

import UIKit

struct CoinDTO: Codable {
    var disclaimer : String
    var chartName : String
    var bpi : BPI
    
    enum CodingKeys: String, CodingKey {
        case disclaimer = "disclaimer"
        case chartName = "chartName"
        case bpi = "bpi"
    }
}

struct BPI: Codable {
    var usd : USD
    var gbp : GBP
    var eur : EUR
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case gbp = "GBP"
        case eur = "EUR"
    }
}

struct USD : Codable {
    var code : String
    var symbol : String
    var rate_float : Double
    var description : String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case symbol = "symbol"
        case rate_float = "rate_float"
        case description = "description"

    }
}

struct GBP: Codable {
    var code : String
    var symbol : String
    var rate_float : Double
    var description : String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case symbol = "symbol"
        case rate_float = "rate_float"
        case description = "description"

    }
}

struct EUR: Codable {
    var code : String
    var symbol : String
    var rate_float : Double
    var description : String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case symbol = "symbol"
        case rate_float = "rate_float"
        case description = "description"

    }
}

