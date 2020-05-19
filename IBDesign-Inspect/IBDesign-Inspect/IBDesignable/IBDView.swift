//
//  IBDView.swift
//  IBDesign-Inspect
//
//  Created by BALAMURUGAN on 20/04/20.
//  Copyright © 2020 BALAMURUGAN. All rights reserved.
//

import UIKit

class IBDView : UIView {
    
    @IBInspectable var cornerRadius : Double {
        get{
            return Double(self.layer.cornerRadius)
        }set{
            self.layer.cornerRadius = CGFloat(newValue)
        }
        
    }

    
    @IBInspectable var borderWidth: CGFloat = 0.0{
        
        didSet{
            
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }

    
    override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
    }
    
    // MARK: - Shadow
    
    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    // MARK: - Gradient
       
       @IBInspectable var firstColor: UIColor = UIColor.white {
           didSet {
               updateView()
           }
       }
       
       @IBInspectable var secondColor: UIColor = UIColor.white {
           didSet {
               updateView()
           }
       }
       
       @IBInspectable var horizontalGradient: Bool = false {
           didSet {
               updateView()
           }
       }
       
       override class var layerClass: AnyClass {
           get {
               return CAGradientLayer.self
           }
       }
       
       func updateView() {
           let layer = self.layer as! CAGradientLayer
           layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
           
           if (horizontalGradient) {
               layer.startPoint = CGPoint(x: 0.0, y: 0.5)
               layer.endPoint = CGPoint(x: 1.0, y: 0.5)
           } else {
               layer.startPoint = CGPoint(x: 0, y: 0)
               layer.endPoint = CGPoint(x: 0, y: 1)
           }
       }
       
    
}
