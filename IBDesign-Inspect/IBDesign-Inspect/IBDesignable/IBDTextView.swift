//
//  IBDTextView+Design.swift
//  Saauti
//
//  Created by OmniProTech on 01/02/18.
//  Copyright © 2018 Omnipro Technologies. All rights reserved.
//

import UIKit
    
    private let kPlaceholderTextViewInsetSpan: CGFloat = 8
    
    @IBDesignable class IBDTextView : UITextView {
        // variables
        
        /** The string that will be put in the placeholder */
        @IBInspectable var placeholder: NSString? { didSet { setNeedsDisplay() } }
        /** color for the placeholder text. Default is UIColor.lightGrayColor() */
        @IBInspectable var placeholderColor: UIColor = UIColor.lightGray
        
        /** Border color for the text view */
        @IBInspectable var borderColor: UIColor = UIColor.clear {
            didSet {
                self.layer.borderColor = borderColor.cgColor
            }
        }
        /** Border color for the text view */
        @IBInspectable var borderWidth: CGFloat = 0.0 {
            didSet {
                self.layer.borderWidth = borderWidth
            }
        }
        /** Border color for the text view */
        @IBInspectable var cornerRadius: CGFloat = 6.0 {
            didSet {
                self.layer.cornerRadius = cornerRadius
                self.layer.masksToBounds = cornerRadius > 0.0
            }
        }
        
        // MARK: - Text insertion methods need to "remove" the placeholder when needed
        
        /** Override normal text string */
        override var text: String! { didSet { setNeedsDisplay() } }
        
        /** Override attributed text string */
        override var attributedText: NSAttributedString! { didSet { setNeedsDisplay() } }
        
        /** Setting content inset needs a call to setNeedsDisplay() */
        override var contentInset: UIEdgeInsets { didSet { setNeedsDisplay() } }
        
        /** Setting font needs a call to setNeedsDisplay() */
        override var font: UIFont? { didSet { setNeedsDisplay() } }
        
        /** Setting text alignment needs a call to setNeedsDisplay() */
        override var textAlignment: NSTextAlignment { didSet { setNeedsDisplay() } }
        
        // MARK: - Lifecycle
        
        /** Override coder init, for IB/XIB compatibility */
        #if !TARGET_INTERFACE_BUILDER
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            listenForTextChangedNotifications()
        }
        
        /** Override common init, for manual allocation */
        override init(frame: CGRect, textContainer: NSTextContainer?) {
            super.init(frame: frame, textContainer: textContainer)
            listenForTextChangedNotifications()
        }
        #endif
        
        /** Initializes the placeholder text view, waiting for a notification of text changed */
        func listenForTextChangedNotifications() {
            
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(IBDTextView_Design.textChangedForPlaceholderTextView(_:)),
                name: UITextView.textDidChangeNotification,
                object: self)
            
//            NotificationCenter.default.addObserver(self, selector: #selector(IBDTextView_Design.textChangedForPlaceholderTextView(_:)), name:NSNotification.Name.UITextView.textDidChangeNotification , object: self)
            
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(IBDTextView_Design.textChangedForPlaceholderTextView(_:)),
                name: UITextField.textDidBeginEditingNotification,
                object: self)
            
//            NotificationCenter.default.addObserver(self, selector: #selector(IBDTextView_Design.textChangedForPlaceholderTextView(_:)), name:NSNotification.Name.UITextView.textDidBeginEditingNotification , object: self)
        }
        
        /** willMoveToWindow will get called with a nil argument when the window is about to dissapear */
        override func willMove(toWindow newWindow: UIWindow?) {
            super.willMove(toWindow: newWindow)
            if newWindow == nil { NotificationCenter.default.removeObserver(self) }
            else { listenForTextChangedNotifications() }
        }
        
        
        // MARK: - Adjusting placeholder.
        @objc func textChangedForPlaceholderTextView(_ notification: Notification) {
            setNeedsDisplay()
            setNeedsLayout()
        }
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            
            // in case we don't have a text, put the placeholder (if any)
            if text.count == 0 && self.placeholder != nil {
                
                let baseRect = placeholderBoundsContainedIn(self.bounds)
                
                let font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
                
                self.placeholderColor.set()
                
                // build the custom paragraph style for our placeholder text
                let customParagraphStyle: NSMutableParagraphStyle! = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
                
                // set attributes
                customParagraphStyle.lineBreakMode = NSLineBreakMode.byTruncatingTail
                customParagraphStyle.alignment = self.textAlignment
                let attributes = [NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: customParagraphStyle.copy() as! NSParagraphStyle, NSAttributedString.Key.foregroundColor: self.placeholderColor]
                // draw in rect.
                self.placeholder?.draw(in: baseRect, withAttributes: attributes)
            }
        }
        
        func placeholderBoundsContainedIn(_ containerBounds: CGRect) -> CGRect {
            // get the base rect with content insets.
//            let baseRect = UIEdgeInsetsInsetRect(containerBounds, UIEdgeInsets(top: kPlaceholderTextViewInsetSpan, left: kPlaceholderTextViewInsetSpan/2.0, bottom: 0, right: 0))
            
            let baseRect = containerBounds.inset(by: UIEdgeInsets(top: kPlaceholderTextViewInsetSpan, left: kPlaceholderTextViewInsetSpan/2.0, bottom: 0, right: 0))
            
            // adjust typing and selection attributes
            if let paragraphStyle = typingAttributes[NSAttributedString.Key.paragraphStyle] as? NSParagraphStyle {
                baseRect.offsetBy(dx: paragraphStyle.headIndent, dy: paragraphStyle.firstLineHeadIndent)
            }
            
            return baseRect
        }
}
