//
//  APIRequest.swift
//  Kenlo
//
//
//

import UIKit

struct DataResponseDataModel<T: Codable>: Codable {
    let statusCode: Int?
    let message: String?
    let data: T?
    let result: T?

}

class APIRequest
{
    
    //MARK: create request to api
    
    func request<T: Codable>(endpoint: Endpoint, parameters: [String: Any]?,urlParam:String = "", completion: @escaping (Result<T, Error>) -> Void) {
        
      //  print(" Params are :- " + "\(String(describing: parameters))")
        // Check reachability
        if !Reachability.isConnectedToNetwork(){
            Helper.shared.alert(title: "Error".localized(), message:NetworkError.noInternet.localizedDescription)
            completion(.failure(NetworkError.noInternet))
            return
        }
        // Build the request URL
        guard let url = URL(string: API.baseURL + endpoint.path) else {

            completion(.failure(NetworkError.invalidURL))
            return
        }
        print("URL:",url)
        // Create the request object
        var request = URLRequest(url: url)
        // specify method for api
        request.timeoutInterval = 1200
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        if(endpoint.path != "/user/login")
//        {
      //  request.setValue(PrefenceManager.shared.accessToken, forHTTPHeaderField: "X-Auth-Token")

        // Add parameters to the request body, if any
        if let parameters = parameters {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = jsonData
            } catch {
                completion(.failure(NetworkError.encodingError))
                return
            }
        }
        
        // Create a URLSessionDataTask to make the request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // Handle errors
            if let error = error {

                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            // Handle status code errors
            switch httpResponse.statusCode {
            case 200...599:
                // Parse the response data
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
                
                if let responseData = data {
                    do {
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(T.self, from: responseData)
                        completion(.success(object))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    // invalid data
                    completion(.failure(NetworkError.invalidData))
                }
            case 406:
                completion(.failure(NetworkError.authenticationError))
            case 401:
                completion(.failure(NetworkError.authenticationError))
            case 500...599:
                completion(.failure(NetworkError.serverError))
            default:
                completion(.failure(NetworkError.unknownError))
            }
        }
        
        task.resume()
    }


    
    //MARK: create request to api
    func requestWithHeaders<T: Codable>(endpoint: Endpoint, parameters: [String: Any]?,urlParam:String = "", completion: @escaping (Result<T, Error>) -> Void) {
        
        // Check reachability
        if !Reachability.isConnectedToNetwork(){
            completion(.failure(NetworkError.noInternet))
            return
        }

        // Build the request URL
        guard let url = URL(string: API.baseURL + endpoint.path) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request: URLRequest

        if urlParam.count > 0 {
            // Construct the full URL by appending urlParam to the original URL
            let fullURLString = url.absoluteString + urlParam
            
            if let updatedURL = URL(string: fullURLString) {
                request = URLRequest(url: updatedURL)
            } else {
                // Handle the case where the URL is invalid
                // You may choose to use the original URL or handle the error differently
                request = URLRequest(url: url)
            }
        } else {
            request = URLRequest(url: url)
        }

        
        // specify method for api
        request.httpMethod = endpoint.method.rawValue

        if let parameters = parameters {
            var parameterArray = [String]()
            
            for (key, value) in parameters {
                // Encode each key-value pair and append it to the array
                
                let encodedValue: String
                    if let numberValue = value as? NSNumber {
                        encodedValue = numberValue.stringValue
                    } else if let stringValue = value as? String {
                        encodedValue = stringValue
                    } else {
                        // Handle other types or nil values as needed
                        continue // Skip this key-value pair
                    }
                
                if let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                   let encodedValue = (encodedValue as AnyObject).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    let parameterString = "\(encodedKey)=\(encodedValue)"
                    parameterArray.append(parameterString)
                }
            }
            
            // Join the parameter array into a single string with "&" separators
            let parameterString = parameterArray.joined(separator: "&")
            
            // Set the request's HTTPBody and Content-Type header
            request.httpBody = parameterString.data(using: .utf8)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }
        
        // Create a URLSessionDataTask to make the request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            // Handle errors
            if let error = error {
                Helper.shared.alert(title: "Error".localized(), message: NetworkError.invalidResponse.localizedDescription)

                completion(.failure(error))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
               // print(json)
            } catch {
                Helper.shared.alert(title: "Error".localized(), message: NetworkError.invalidResponse.localizedDescription)

                print(error.localizedDescription)
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                // handle if response wrong
                Helper.shared.alert(title: "Error".localized(), message: NetworkError.invalidResponse.localizedDescription)

                completion(.failure(NetworkError.invalidResponse))
                return
            }
            

            
            // Handle status code errors
            switch httpResponse.statusCode {
            case 200...299:
                // Parse the response data
                if let responseData = data {
                    do {
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(T.self, from: responseData)
                        completion(.success(object))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    // invalid data
                    Helper.shared.alert(title: "Error".localized(), message: NetworkError.invalidResponse.localizedDescription)

                    completion(.failure(NetworkError.invalidData))
                }
            case 401:
                completion(.failure(NetworkError.authenticationError))
            case 500...599:
                completion(.failure(NetworkError.serverError))
            default:
                completion(.failure(NetworkError.unknownError))
            }
        }
        
        task.resume()
    }

    //MARK: create background request to api
    func backgroundRequest<T: Codable>(endpoint: Endpoint, parameters: [String: Any]?, urlParam: String = "", completion: @escaping (Result<T, Error>) -> Void) {
        // Check reachability
        if !Reachability.isConnectedToNetwork() {
            completion(.failure(NetworkError.noInternet))
            return
        }

        // Build the request URL
        guard let url = URL(string: API.baseURL + endpoint.path) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        var request: URLRequest

        if urlParam.count > 0 {
            // Construct the full URL by appending urlParam to the original URL
            let fullURLString = url.absoluteString + urlParam

            if let updatedURL = URL(string: fullURLString) {
                request = URLRequest(url: updatedURL)
            } else {
                // Handle the case where the URL is invalid
                // You may choose to use the original URL or handle the error differently
                request = URLRequest(url: url)
            }
        } else {
            request = URLRequest(url: url)
        }

        // Specify method for API
        request.httpMethod = endpoint.method.rawValue

        if let parameters = parameters {
            var parameterArray = [String]()

            for (key, value) in parameters {
                // Encode each key-value pair and append it to the array
                if let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                   let encodedValue = (value as AnyObject).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    let parameterString = "\(encodedKey)=\(encodedValue)"
                    parameterArray.append(parameterString)
                }
            }

            // Join the parameter array into a single string with "&" separators
            let parameterString = parameterArray.joined(separator: "&")

            // Set the request's HTTPBody and Content-Type header
            request.httpBody = parameterString.data(using: .utf8)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        }

        // Create a URLSessionDataTask to make the request
        let config = URLSessionConfiguration.background(withIdentifier: "com.example.MyApp.backgroundSession")
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            // Handle errors
            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
               // print(json)
            } catch {
                print(error.localizedDescription)
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                // handle if response wrong
                completion(.failure(NetworkError.invalidResponse))
                return
            }

            // Handle status code errors
            switch httpResponse.statusCode {
            case 200...299:
                // Parse the response data

                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
//                    print(json)
                } catch {
                    print(error.localizedDescription)
                }

                if let responseData = data {
                    do {
                        let decoder = JSONDecoder()
                        let object = try decoder.decode(T.self, from: responseData)
                        completion(.success(object))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    // invalid data
                    completion(.failure(NetworkError.invalidData))
                }
            case 401:
                completion(.failure(NetworkError.authenticationError))
            case 500...599:
                completion(.failure(NetworkError.serverError))
            default:
                completion(.failure(NetworkError.unknownError))
            }
        }

        task.resume()
    }

    
}


