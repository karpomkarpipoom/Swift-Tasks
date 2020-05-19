//
//  IBDTextField+Design.swift
//  Saauti
//
//  Created by Omnipro Technologies on 15/09/17.
//  Copyright © 2017 Omnipro Technologies. All rights reserved.
//

import UIKit

@IBDesignable
class IBDTextField : UITextField {

    // MARK: - IBInspectable    
    @IBInspectable var image        : UIImage? = nil
    
    @IBInspectable var placeholderText  : String?
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    @IBInspectable var imgTopInset      : CGFloat = 7.0
    
    @IBInspectable var imgBottomInset   : CGFloat = 7.0
    
    @IBInspectable var imgLeftInset     : CGFloat = 10.0
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
    @IBInspectable var paddingValue: CGFloat = 0
    
    
    @IBInspectable var borderColor: UIColor? = UIColor.clear {
        didSet {
            layer.borderColor = self.borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    
    // MARK: - Properties
//    var textFont = UIFont(name: "Museo", size: 14.0)
    var imgView: UIImageView?


    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if self.image != nil {
            self.imgView = UIImageView(frame: CGRect(origin: CGPoint(x: self.imgLeftInset,y :self.imgTopInset), size: CGSize(width: self.bounds.height - (self.imgTopInset + self.imgBottomInset), height: self.bounds.height - (self.imgTopInset + imgBottomInset))))
            
            self.imgView!.contentMode = .scaleAspectFit
            self.imgView!.image = self.image
            self.addSubview(self.imgView!)
            
        }
    }
    
    // Placeholder text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        if let iView = self.imgView {
            return bounds.insetBy(dx: iView.bounds.size.width + 15, dy: 0)
        } else {
            return bounds.insetBy(dx: 10, dy: 0)
        }
        
    }
    
    // Editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        if let iView = self.imgView {
            return bounds.insetBy(dx: iView.bounds.size.width + 15, dy: 0)
        } else {
            return bounds.insetBy(dx: 10, dy: 0)
        }
    }

   

}
