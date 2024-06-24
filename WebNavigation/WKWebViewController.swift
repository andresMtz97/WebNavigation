//
//  WKWebViewController.swift
//  WebNavigation
//
//  Created by DISMOV on 27/04/24.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let timeOutInterval: TimeInterval = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        activityIndicator.startAnimating()
        
//        if let url = URL(string: "https://httpstat.us/200?sleep=1000") {
        if let url = URL(string: "https://developer.apple.com/documentation/uikit/uiapplication/1648685-open") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + timeOutInterval) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.timeOutHandler()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WKWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        print("finishes")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        print("finishes with error: ", error.localizedDescription)
    }
    
    func timeOutHandler() {
        guard webView.isLoading else {
            return
        }
        
        webView.stopLoading()
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        print("Time out ocurred!!")
    }
}
