//
//  WebService.swift
//  JsonParsingTutorial
//
//  Created by Priya Gandhi on 2023-12-05.
//

import UIKit

class WebService: NSObject {
    static let shared : WebService = {
       let instance = WebService()
        return instance
    }()
    
    private override init(){
        
    }

    
    
    func fetchFacts( completionHandler : @escaping([Facts]?)-> Void){
        let url = URL(string: baseURL)!
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err{
            }else if let data = data, let responseDict = try? JSONDecoder().decode([Facts].self, from: data){
                completionHandler(responseDict)
            }
        }
        task.resume()
    }
    
    func fetchCoinInfo( completionHandler : @escaping(CoinDTO?)-> Void){
        let url = URL(string: currPriceURL)!
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err{
            }else if let data = data, let responseDict = try? JSONDecoder().decode(CoinDTO.self, from: data){
                completionHandler(responseDict)
            }
        }
        task.resume()
    }


}
