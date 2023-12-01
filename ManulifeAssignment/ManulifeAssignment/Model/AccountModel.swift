//
//  AccountModel.swift
//  ManulifeAssignment
//
//  Created by Priya Gandhi on 2023-11-28.
//

import UIKit
import SwiftUI


struct Account: Codable, Identifiable {
    let id: Int
    let display_name: String
    let account_number: String
    let balance: Double
}

struct Transactions: Codable {
    let date: String
    let activity: [Activity]
}

// MARK: - Activity
struct Activity: Codable, Identifiable {
    let id: Int
    let date, description: String
    let depositAmount: Double?
    let balance: Double
    let transactionUid: Int
    let withdrawalAmount: Double?

    enum CodingKeys: String, CodingKey {
        case id, date, description
        case depositAmount = "deposit_amount"
        case balance
        case transactionUid = "transaction_uid"
        case withdrawalAmount = "withdrawal_amount"
    }
}

typealias transaction = [Transactions]


enum AccountType: String {
    case saving = "Savings Account"
    case tfsa = "TFSA Account"
    case chequing = "Chequing Account"
}
