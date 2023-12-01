//
//  PreferenceManager.swift
//  ManulifeAssignment
//
//  Created by Priya Gandhi on 2023-11-28.
//

import UIKit
enum UserDefaultKey: String {
    case Account
}

class PreferenceManager {
    static let shared = PreferenceManager()
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    // Store value for a given key
    func set(_ value: [Account], forKey key: UserDefaultKey)  {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value){
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
            return defaults.set(encoded, forKey: key.rawValue)
        }
    }
    
    // Retrieve value for a given key
    func get(forKey key: UserDefaultKey) -> [Account] {
        if let objects = UserDefaults.standard.value(forKey: key.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode([Account].self, from: objects) as [Account] {
                return objectsDecoded
            }
        }
        return []
    }
    //delete value
    func deletingObjectsForKey(key: UserDefaultKey){
        defaults.removeObject(forKey: key.rawValue)
        defaults.synchronize()
    }
}
