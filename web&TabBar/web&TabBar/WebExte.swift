//
//  WebExte.swift
//  web&TabBar
//
//  Created by OmniproEdge on 14/03/18.
//  Copyright © 2018 karpomkarpipoom. All rights reserved.
//

import UIKit
import WebKit

extension WKWebView{
    
    func loadURL(strURL : String) {
        if let url = URL( string : strURL) {
            load(URLRequest(url : url))
        }
    }
}

