//
//  API.swift
//  Kenlo
//
//  
//

import UIKit

// declaration of base url and all the endpoints
struct API {
    static let baseURL = "http://44.223.53.133:4000/api/"
    static let signUp = Endpoint(path: "user/sign-up", method: .post)
    static let login = Endpoint(path: "user/login", method: .post)
    static let forgotPassword = Endpoint(path: "user/forgot-password", method: .post)
    static let resetPassword = Endpoint(path: "user/reset-password", method: .post)
    static let resetforgotPassword = Endpoint(path: "user/reset-forgot-password", method: .put)
    static let activateUser = Endpoint(path: "user/activate-user", method: .put)
    static let resendOTP = Endpoint(path: "user/resend-otp", method: .put)


  }
