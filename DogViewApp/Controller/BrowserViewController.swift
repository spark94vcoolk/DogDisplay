//
//  rowserViewController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/03/06.
//

import UIKit
import WebKit

class BrowserViewController: UIViewController,WKNavigationDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var browser: WKWebView!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://www.min-inuzukan.com/") {
            
            let request = URLRequest(url: url)
            browser.load(request)
        }
        browser.navigationDelegate = self
        urlTextField.delegate = self
        
        urlTextField.placeholder = "Search"
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // キーボードを閉じる
        
        if let searchText = textField.text, !searchText.isEmpty {
            // 日本語の検索クエリをURLエンコードする
            if let encodedQuery = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                // Google検索のURL
                let urlString = "https://www.google.com/search?q=\(encodedQuery)"
                if let url = URL(string: urlString) {
                    let request = URLRequest(url: url)
                    browser.load(request)
                }
            }
            
            return true
        }
        return false // それ以外の場合は false を返す
    }
    
    @IBAction func goBack(_ sender: Any) {
        if browser.canGoBack {
            browser.goBack()
        }
    }
    
    @IBAction func goForward(_ sender: Any) {
        if browser.canGoForward {
            browser.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
           // ローディング中に何かしたい場合はここに実装
       }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
}
