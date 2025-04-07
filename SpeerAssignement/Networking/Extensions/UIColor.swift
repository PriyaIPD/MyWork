//
//  UIColor.swift
//  Kenlo Vistoria
//
//  Created by Priya Gandhi on 2024-01-19.
//

import UIKit

extension UIColor {
    static var AppBGColor: UIColor {
        return UIColor.color(name: "AppColors/AppBGColor")
    }
    static var AppLightcolor: UIColor {
        return UIColor.color(name: "AppColors/AppLightcolor")
    }
    static var AppBorderColor: UIColor {
        return UIColor.color(name: "AppColors/AppBorderColor")
    }
    static var AppNeutralColor: UIColor {
        return UIColor.color(name: "AppColors/AppNeutralColor")
    }
    static var AppNeutralDarkColor: UIColor {
        return UIColor.color(name: "AppColors/AppNeutralDarkColor")
    }
    static var AppNeutralLightColor: UIColor {
        return UIColor.color(name: "AppColors/AppNeutralLightColor")
    }
    static var AppRedColor: UIColor {
        return UIColor.color(name: "AppColors/AppRedColor")
    }
    static var AppWhiteColor: UIColor {
        return UIColor.color(name: "AppColors/AppWhiteColor")
    }

    private static func color(name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            return .black
        }
        return color
    }
}
