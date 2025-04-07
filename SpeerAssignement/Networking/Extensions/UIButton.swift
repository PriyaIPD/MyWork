//
//  UIButton.swift
//  Kenlo Vistoria
//
//  Created by Priya Gandhi on 2024-01-19.
//

import UIKit

extension UIButton{
    //Set alpha of UIButton
    func alpha (_ value : Double){
        self.alpha = value
    }
    
    //Customizable Calender button (Left and Right Arrow)
    func setupCalenderButton(imageName: String , btnXOrigin : Double, superView: UIView){
        self.frame = CGRect.init(x: btnXOrigin, y: 20.0, width: 20, height: 20)
        self.setImage(UIImage(named: imageName), for: .normal)
        superView.addSubview(self);
    }
    
    
    
}
