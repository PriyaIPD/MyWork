//
//  ShoppingList.swift
//  EasyShopper
//
//  Created by Priya Gandhi on 2023-12-07.
//

import UIKit

struct ShoppingList: Codable, Identifiable {    
    
    
    var barcode : String
    var description : String
    var id : String
    var image_url : String
    var name : String
    var retail_price : Int


}
