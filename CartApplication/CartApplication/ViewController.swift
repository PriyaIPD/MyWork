//
//  ViewController.swift
//  CartApplication
//
//  Created by Priya Gandhi on 2023-11-23.
//

import UIKit

class ViewController: UIViewController {
    var vm = ViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        // Do any additional setup after loading the view.
    }
    
    func setupData(){
        let cherrios = CartItem(name: "Pizza", price: 15.0, barcode: "73465jfbjf", qty: 3)
        let milk = CartItem(name: "milk", price: 2.49, barcode: "8763", qty: 3)
        let bread = CartItem(name: "bread", price: 1.99, barcode: "983732", qty: 3)
        let classObj = CartInfo()
        let pizza = CartItem(name: "Pizza", price: 11.99, barcode: "3732", qty: 12)
        //1: Add Object
        classObj.add(item: pizza)
        print("after addition", classObj.cartItem)

        //2: Remove Object
        classObj.remove(item: pizza)
        print("after deletion", classObj.cartItem)

        //3: Remove All Objects
        classObj.clearAllItems()
        let a = CartItem(name: "Pizza", price: 15.0, barcode: "73465jfbjf", qty: 3)
        let b = CartItem(name: "milk", price: 2.49, barcode: "8763", qty: 3)
        let c = CartItem(name: "bread", price: 1.99, barcode: "983732", qty: 3)
         //4
        classObj.add(item: a)
        classObj.add(item: b)
        classObj.add(item: c)

      let item =  classObj.getCartItemFor(barcode: "8763")
        classObj.add(item: item!)
        print("after getting", classObj.cartItem)

        
        //5
      let numebrofItems =  classObj.totalQuantityOfItems()
        print("Number of items", numebrofItems)
        
        //6
       let totalCost = classObj.totalCartCost()
        print("NTotal Cost", totalCost)

        
        let qty = classObj.getQuantityFor(item: a)
        print(qty)
    }


}

