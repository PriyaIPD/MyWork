//
//  APIError.swift
//  Kenlo
//
//  
//

import UIKit
// declaration of error enum for api request
enum NetworkError: Error {
    case encodingError
    case invalidResponse
    case invalidData
    case authenticationError
    case serverError
    case noInternet
    case invalidURL
    case unknownError
    
    // declare error messages 
    var localizedDescription: String {
        switch self {
        case .encodingError:
            return "Unable to encode parameters."
        case .invalidResponse:
            return "Invalid response from the server."
        case .invalidData:
            return "Invalid data received from the server."
        case .authenticationError:
            return "User already exists with this userName."
        case .serverError:
            return "Server error occurred."
        case .noInternet:
            return "No internet connection available."
        case .invalidURL:
            return "Invalid URL provided."
        case .unknownError:
            return "Unknow Error"
        }
    }
}

enum StatusCodes : String {
    case IncorrectCredentials
    case UserNotExist
    case NotVerifiedUser
    case unknownError

    
    // declare error messages
    var localizedDescription: String {
        switch self {
        case .IncorrectCredentials:
            return "223"
        case .UserNotExist:
            return "224"
        case .NotVerifiedUser:
            return "226"
        case .unknownError:
            return "225"
        }
    }
}

