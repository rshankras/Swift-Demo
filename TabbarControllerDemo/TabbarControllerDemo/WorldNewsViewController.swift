//
//  ViewController.swift
//  TabbarControllerDemo
//
//  Created by Ravi Shankar on 02/07/15.
//  Copyright (c) 2015 Ravi Shankar. All rights reserved.
//

import UIKit
import WebKit

class WorldNewsViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        let url = URL(string: "https://www.bbc.com/news/world")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}

