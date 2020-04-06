//
//  ViewController.swift
//  Webview2
//
//  Created by Kazuya Fukui on 2020/04/02.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
//    var webView = WKWebView()
    @IBOutlet weak var webView1: WKWebView!
    
    @IBOutlet weak var webView2: WKWebView!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var indicator2: UIActivityIndicatorView!
    
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var toolBar2: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView1.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2)
        view.addSubview(webView1)
        
        webView2.frame = CGRect(x: 0, y: view.frame.size.height/2 + toolBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height/2 - toolBar.frame.size.height*2)
        
        toolBar.frame = CGRect(x: 0, y: view.frame.size.height/2, width: view.frame.size.width, height: toolBar.frame.size.height)
        
        toolBar2.frame = CGRect(x: 0, y:view.frame.size.height - toolBar.frame.size.height, width: view.frame.size.width, height: toolBar.frame.size.height)
        
        webView1.navigationDelegate = self
        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        webView1.load(request)
        
        webView2.navigationDelegate = self
        let url2 = URL(string: "https://www.yahoo.co.jp/")
        let request2 = URLRequest(url: url2!)
        webView2.load(request2)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        print("読み込み開始")
        indicator.startAnimating()
        print("読み込み開始")
        indicator2.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        print("読み込み完了")
        indicator.stopAnimating()
        print("読み込み完了")
        indicator2.stopAnimating()
    }

    @IBAction func back(_ sender: Any) {
        
        webView1.goBack()
    }
    
    @IBAction func go(_ sender: Any) {
        
        webView1.goForward()
    }



    @IBAction func back2(_ sender: Any) {
    
         webView2.goBack()
    }
    

    @IBAction func go2(_ sender: Any) {
    
        webView2.goForward()
    }
    


}

