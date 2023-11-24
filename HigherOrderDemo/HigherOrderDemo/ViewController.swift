//
//  ViewController.swift
//  HigherOrderDemo
//
//  Created by Priya Gandhi on 2023-11-24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        performHigherOrderOperations(arr: [3,7,1,0,5,-1,2])
        // Do any additional setup after loading the view.
    }
    
    
    func performHigherOrderOperations(arr :[ Int]){
        //1. MAP function to multiple each value of array by 5
        let arrMapped = arr.map({$0 * 5})
        print("Map Operation Result is", arrMapped);
        
        //2. FIlter function to get even numbers only
        let filteredArr = arr.filter({$0 % 2 == 0})
        print("Filter Operation Result is", filteredArr);

        //3. Sort function
        let sortedArr = arr.sorted { a, b in
            return a < b
        }
        print("Sort Operation Result is",sortedArr)

        //4. Reduce function
        let sum = arr.reduce(0, { x, y in
            x + y
        })
        print("Reduce Operation Result is",sum)

       //5, flatmap
        let arrWithInArr = [[10,25,30],[45,50]]
        let arrFlaten = arrWithInArr.flatMap { array in
            return array
        }
        print(arrFlaten)
    }
    
    


}

