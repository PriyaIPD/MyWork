//
//  APIEndpoint.swift
//  Kenlo
//
// 
//

import UIKit

// declare method types
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// create class with path and method 
class Endpoint {
    let path: String
    let method: HTTPMethod
    
    init(path: String, method: HTTPMethod) {
        self.path = path
        self.method = method
    }
}
