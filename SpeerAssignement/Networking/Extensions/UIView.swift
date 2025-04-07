//
//  UIView.swift
//  Kenlo Vistoria
//
//  Created by Priya Gandhi on 2024-01-19.
//

import UIKit

//MARK:- Color, Border, CornerRadius Extension
@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}


extension UISegmentedControl {
@IBInspectable var textSelectedColor: UIColor {
    get {
        return self.textSelectedColor
    }
    set {
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: newValue], for: .selected)
    }
}

@IBInspectable var textNormalColor: UIColor {
    get {
        return self.textNormalColor
    }
    set {
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: newValue], for: .normal)
    }
}}
extension UIView
{
    // MARK: set only Top Right and Left corner radius for Specified View
    func roundTopCorners(cornerRadius:CGFloat)
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        // This function sets the corner radius of the given view to the specified top left and top right of View
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    

    func roundBottomCorners(cornerRadius:CGFloat)
    {
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        // This function sets the corner radius of the given view to the specified top left and top right of View
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    // MARK: set Corner Radius for view
    func roundCornersWithBorderColor(cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor)
    {
        // This function sets the corner radius of the given view to the specified radius , border and color
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }

    // MARK: set Corner Radius for view for all corners
    func roundCorners(cornerRadius:CGFloat)
    {
        // This function sets the corner radius of the given view to the specified radius for View
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    // MARK: Add dashed Border For View With corner Radius
    func addDashedBorder(width:CGFloat,height:CGFloat) {
        let color = UIColor.AppBorderColor.cgColor
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let shapeRect = CGRect(x: 0, y: 0, width: width, height: height)
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: width/2, y: height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 12).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
}
enum VerticalLocation: String {
    case bottom
    case top
    case center
}

extension UIView {
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.2, radius: CGFloat = 3.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 2), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -2), color: color, opacity: opacity, radius: radius)
        case .center:
            addShadow(offset: CGSize(width: 0, height: 0), color: color, opacity: opacity, radius: radius)
        }
    }
    
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.3, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func addTopShadow(shadowColor : UIColor, shadowOpacity : Float,shadowRadius : Float,offset:CGSize){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = CGFloat(shadowRadius)
        self.clipsToBounds = false
    }
    
    /* Usage Example
     * bgView.addBottomRoundedEdge(desiredCurve: 1.5)
     */
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat = self.frame.width / desiredCurve!
        let bounds: CGRect = self.bounds
        
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
    }
}
