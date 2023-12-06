//
//  TransactionsDTO.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-04.
//

import UIKit

struct TransactionsDTO : Codable{
    var transactions : [Transactions]

}
    struct Transactions : Codable{
        var datastr : String
    }


// WelcomeElement.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcomeElement = try? newJSONDecoder().decode(WelcomeElement.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    var date: String
    var activity: [Activity]
}

// Activity.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let activity = try? newJSONDecoder().decode(Activity.self, from: jsonData)

import Foundation

// MARK: - Activity
struct Activity: Codable {
    var id: Int
    var date, description: String
    var depositAmount: Double?
    var balance: Double
    var transactionUid: Int
    var withdrawalAmount: Double?

    enum CodingKeys: String, CodingKey {
        case id, date, description
        case depositAmount = "deposit_amount"
        case balance
        case transactionUid = "transaction_uid"
        case withdrawalAmount = "withdrawal_amount"
    }
}

// JSONSchemaSupport.swift

import Foundation

typealias Welcome = [[String: [WelcomeElement]]]
