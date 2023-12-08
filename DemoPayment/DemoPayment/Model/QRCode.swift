//
//  QRCode.swift
//  DemoPayment
//
//  Created by Priya Gandhi on 2023-12-07.
//

import UIKit

struct QRCode: Codable {
    var id : String
    var entity : String
    var name : String
    var type : String
    var image_url : String
    var payment_amount : Int
    var status : String
    var description : String
    var customer_id : String

}

