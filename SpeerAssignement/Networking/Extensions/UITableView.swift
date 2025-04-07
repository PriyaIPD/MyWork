//
//  UITableView.swift
//  Kenlo Vistoria
//
//  Created by Priya Gandhi on 2024-01-19.
//

import UIKit

extension UITableView{
    
    func registerCustomCells(identifier : String){
        self.showsHorizontalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        self.separatorStyle = .none
    }
    
    func HideUnhideTable(_ isHide : Bool) {
        return isHide ?  setalpha(val: 0.0) :  setalpha(val: 1.0)
    }
    func setalpha(val : Double){
        self.alpha = val
    }
    
        func reloadDataAsync() {
            DispatchQueue.main.async {
                self.reloadData()
        }
    }
}

extension UITableViewCell{
    func getCurrentViewController() -> UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            if let rootViewController = windowScene.windows.first?.rootViewController {
                var currentController: UIViewController? = rootViewController
                while let presentedController = currentController?.presentedViewController {
                    currentController = presentedController
                }
                return currentController
            }
        }
        return nil
    }
}
