//
//  PetitionVM.swift
//  APIImplementation
//
//  Created by Priya Gandhi on 2023-11-22.
//

import UIKit

class PetitionVM: NSObject {
    func getPetitions(completion:  @escaping(Petitions?, Bool) -> ()){
        guard let url = URL(string: Constants.petitionsUrl) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            data, response, error in
            let decoder = JSONDecoder()
            
            if let data = data{
                do{
                    let tasks = try decoder.decode(Petitions.self, from: data)
                        completion(tasks, true)
                }catch{
                    print(error)
                }
            }
            
        }
        
        task.resume()
    }
}

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
    var status: String

}

struct Petitions: Codable {
    var results: [Petition]
    var metadata: Metadata

}

struct Metadata: Codable {
    var requestInfo: RequestInfo

}

struct RequestInfo: Codable {
    var resource: String

}
