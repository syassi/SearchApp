//
//  WebViewController.swift
//  MySearchApp
//
//  Created by Yasushi Saitoh on 2017/10/28.
//  Copyright © 2017年 Yasushi Saitoh. All rights reserved.
//

import UIKit
//import WebKit // WKWebViewを利用するために必要
import SafariServices // SFSafariViewControllerを利用するために必要

// 商品ページを参照するための画面
class WebViewController: UIViewController {

    // 商品ページのURL
    var itemUrl: String?

    // 商品ページを参照するためのWebView
//    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // User-AgentをiPhoneに設定する　（レスポンシブWebデザインでスマホサイト表示にしたい為）
 //       webView.customUserAgent = "Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1"

        // WebViewのurlを読み込ませてWebページを表示させる
        guard let itemUrl = itemUrl else {
            return
        }
        guard let url = URL(string: itemUrl) else {
            return
        }
        
        let brow = SFSafariViewController(url: url)
        brow.delegate = self
        self.present(brow, animated: true, completion: nil)
        
        //let request = URLRequest(url: url)
        //webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: SFSafariViewControllerDelegate
extension WebViewController: SFSafariViewControllerDelegate {
    func safariViewController(_ controller: SFSafariViewController,
                                   didCompleteInitialLoad didLoadSuccessfully: Bool) {
        print("---- Load ---")
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        print("### Finish ###")
    }
}
