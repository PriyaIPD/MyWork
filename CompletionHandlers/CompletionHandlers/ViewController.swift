//
//  ViewController.swift
//  CompletionHandlers
//
//  Created by Priya Gandhi on 2023-11-23.
//

import UIKit

class ViewController: UIViewController {
var model = HandlerModel()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        espacingCompletionHandler()
        // Do any additional setup after loading the view.
    }
    
    func nonEspacingCompletionHandler(){
        let arr = [23,1,00,80,90,4,34,7]
        model.sortData(arr: arr) { result in
            print("Sorted Array is", result)
        }
    }
    
    func espacingCompletionHandler(){
        let arr = [23,1,00,80,90,4,34,7]
        model.sortDataWithNonEscaping(arr: arr) {[weak self] (res) in
        }
    }


}

