//
//  ViewController.swift
//  IOSWebViewTutorial
//
//  Created by Arthur Knopper on 29/03/2019.
//  Copyright © 2019 Arthur Knopper. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let htmlPath = Bundle.main.path(forResource: "www/index", ofType: "html")

        let url = URL(fileURLWithPath: htmlPath!)

        let request = URLRequest(url: url)
        
        // 1
        webView.load(request)
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }


}

