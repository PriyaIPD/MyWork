//
//  WebService.swift
//  EasyShopper
//
//  Created by Priya Gandhi on 2023-12-07.
//

import UIKit

class WebService: NSObject {
   @Published var sum : Int = 0
    private override init() {}
    
    static let shared : WebService = {
        let instance = WebService()
        return instance
    }()
    
    func fetchItems(completionHandler : ([String: ShoppingList], Int?) -> Void) {
        do {
           if let bundlePath = Bundle.main.path(forResource: "DemoData", ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
              if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
                 //print("JSON: \(json)")
                 print(json.keys)
                  
                  if let parse = try? JSONDecoder().decode([String: ShoppingList].self, from: jsonData){
                    //  print("JSON: \(parse)")
                      
                      self.sum = parse.compactMap {$0.value.retail_price}.reduce(0, +)
                      
                      completionHandler(parse, sum)

                  }
                  
                  
              } else {
                 print("Given JSON is not a valid dictionary object.")
              }
           }
        } catch {
           print(error)
        }
     }
}


