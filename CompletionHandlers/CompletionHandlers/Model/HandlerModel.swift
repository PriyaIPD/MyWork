//
//  HandlerModel.swift
//  CompletionHandlers
//
//  Created by Priya Gandhi on 2023-11-23.
//

import UIKit

class HandlerModel: NSObject {

    var compileHandler : (([Int]) -> Void)?
    func sortData(arr: [Int], completion : (_ result : [Int])-> Void){
       let arrFilter =  arr.sorted()
        completion(arrFilter)
    }
    
    func sortDataWithNonEscaping(arr: [Int], completion : @escaping (_ result : [Int])-> Void){
       let arrFilter =  arr.sorted()
        compileHandler = completion
        compileHandler!(arrFilter)
    }
    
    
}
