//
//  WebServices.swift
//  DemoPayment
//
//  Created by Priya Gandhi on 2023-12-07.
//

import UIKit
import Razorpay
class WebServices: NSObject, RazorpayPaymentCompletionProtocol {
    func onPaymentError(_ code: Int32, description str: String) {
        
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
    }
    
    var razorpay: RazorpayCheckout!

    static let shared : WebServices = {
       let instance = WebServices()
        return instance
    }()
    private override init(){
        razorpay = RazorpayCheckout.initWithKey(razorpayTestKey, andDelegate: self)
    }
    
    func createQRCode(){
        let url = URL(string: baseURL.appending(createQR))!
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
             if let data = data, let responseDict = try? JSONDecoder().decode(QRCode.self, from: data){
                 print(responseDict)

            }
        }
        task.resume()
    }
}
