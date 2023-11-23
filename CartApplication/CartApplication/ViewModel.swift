//
//  ViewModel.swift
//  CartApplication
//
//  Created by Priya Gandhi on 2023-11-23.
//

import UIKit

class ViewModel: NSObject {

}
 
// This structure represents a product that we will be storing in our cart:
struct CartItem {
    // name ie. FunGuys Ice Cream Vanilla Flavoured 300 ml
    let name: String
    // 3.49
    let price: Double
    // primary key, unique to the product type
    let barcode: String
    let qty: Int

}
 
protocol CartType {
    // insert and remove cart items from cart
    func add(item: CartItem)
    func remove(item: CartItem)
 
    // remove all items
    func clearAllItems()
 
    // get quantity ie. show customer wants 3x of item on detail screen
    func getQuantityFor(item: CartItem) -> Int
    
    // return an optional cart item if its stored in our cart, based on the barcode
    func getCartItemFor(barcode: String) -> CartItem?
    
    // total sum of all items and item quantities
    func totalQuantityOfItems() -> Int
        
    // total sum price of all items and quantities
    func totalCartCost() -> Double
 
    // Bonus:
    // checks to see if we have a substitution selected for this item, optional
    // func getSubstitutionFor(cartItem: CartItem) -> CartItem?
    // sets a cartitem as a substiution for another cartitem
    // func setSubstitutionFor(cartItem: CartItem, substitution: CartItem)
}

class CartInfo : CartType{
    var cartItem : [CartItem] = []
    var count : Int = 0

    func add(item: CartItem){
        cartItem.append(item)
        count += 1
    }
    func remove(item: CartItem){
        let index = cartItem.firstIndex(where: {$0.name == item.name})
        cartItem.remove(at: index!)
        count -= 1
    }
 
    // remove all items
    func clearAllItems(){
        cartItem.removeAll()
    }
 
    // get quantity ie. show customer wants 3x of item on detail screen
    func getQuantityFor(item: CartItem) -> Int{
        let itemCount = cartItem.first(where: {$0.barcode == item.barcode})
        return itemCount?.qty ?? -1
    }
    
    // return an optional cart item if its stored in our cart, based on the barcode
    func getCartItemFor(barcode: String) -> CartItem?{
        let cartObj = cartItem.first(where: {$0.barcode == barcode})
        return cartObj
    }
    
    // total sum of all items and item quantities
    func totalQuantityOfItems() -> Int{
        return count

    }
        
    // total sum price of all items and quantities
    func totalCartCost() -> Double{
        var total_price: Double = 0.0
           for items in cartItem {
                let price = items.price
                   total_price += items.price
           }
        return total_price

    }
}
 
//let cherrios = CartItem(name: "cheerios", price: 4.99, barcode: "1235")
//let milk = CartItem(name: "milk", price: 2.49, barcode: "8763")
//let bread = CartItem(name: "bread", price: 1.99, barcode: "983732")
