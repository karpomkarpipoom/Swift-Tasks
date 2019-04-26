//
//  fbVC.swift
//  web&TabBar
//
//  Created by OmniproEdge on 14/03/18.
//  Copyright © 2018 karpomkarpipoom. All rights reserved.
//

import UIKit
import WebKit

class fbVC: UIViewController {

    @IBOutlet weak var webview : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.navigationDelegate = self
        
        webview.loadURL(strURL: "http://www.facebook.com")
        
        // Do any additional setup after loading the view.
    }
    
}

extension fbVC : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("web is start loading")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("web is finish loading")
    }
    
}
