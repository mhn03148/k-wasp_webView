//
//  ViewController.swift
//  web
//
//  Created by 주진형 on 2022/04/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myWebView: WKWebView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string:  url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        myWebView.navigationDelegate = self
        myWebView.translatesAutoresizingMaskIntoConstraints = false
        
        
        loadWebPage("http://147.46.229.53:800/cgi-bin/fswepp/wasp/wasp.pl")
        
    }
    func webView( _ webView: WKWebView, didCommit navigation: WKNavigation!){
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_webView: WKWebView, didFinish navigation: WKNavigation!){
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = false
    }
    
    //
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}

