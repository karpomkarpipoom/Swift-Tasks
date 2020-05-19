//
//  IBDViewController.swift
//  IBDesign-Inspect
//
//  Created by BALAMURUGAN on 21/04/20.
//  Copyright © 2020 BALAMURUGAN. All rights reserved.
//

import UIKit

@IBDesignable
class IBDViewController : UIViewController {
    
    @IBInspectable var lightStatusBar: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            if lightStatusBar {
                return UIStatusBarStyle.lightContent
            } else {
                return UIStatusBarStyle.default
            }
        }
    }
}
