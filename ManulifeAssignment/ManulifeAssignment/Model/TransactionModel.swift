//
//  TransactionModel.swift
//  ManulifeAssignment
//
//  Created by Priya Gandhi on 2023-12-01.
//

import UIKit




struct ManulifeTransactions : Codable {
    let date: String
    let activity: [ActivityD]
}

// MARK: - Activity
struct ActivityD : Codable {
    let id: Int
    let date, activityDescription: String
    let depositAmount: Double?
    let balance: Double
    let transactionUid: Int
    let withdrawalAmount: Double?
}
