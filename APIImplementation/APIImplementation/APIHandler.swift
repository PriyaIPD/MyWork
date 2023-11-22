//
//  APIHandler.swift
//  APIImplementation
//
//  Created by Priya Gandhi on 2023-11-22.
//

import UIKit

class APIHandler: NSObject {
    func callSingleObjectAPI(completion:  @escaping(User?, Bool) -> ()){
        guard let url = URL(string: Constants.url) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode(User.self, from: data)
                    completion(tasks, true)
                }catch{
                    print(error)
                }
            }
            
        }
        
        task.resume()
    }
    
    func getPosts(completion:  @escaping([Post]?, Bool) -> ()){
        guard let url = URL(string: Constants.postsUrl) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode([Post].self, from: data)
                        completion(tasks, true)
                }catch{
                    print(error)
                }
            }
            
        }
        
        task.resume()
    }
}
struct User:Codable{
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
}

struct Post:Codable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}
