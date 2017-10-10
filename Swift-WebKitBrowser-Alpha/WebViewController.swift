//
//  WebViewController.swift
//  Swift-WebKitBrowser-Alpha
//
//  Created by 竹内健 on 2017/10/11.
//  Copyright © 2017年 竹内健. All rights reserved.
//

import WebKit

class WebViewController: WKWebView, WKUIDelegate, WKNavigationDelegate {
	var webView: WKWebView!
	
	func loadWebView() {
		let webConfiguration = WKWebViewConfiguration()
		webView = WKWebView(frame: .zero, configuration: webConfiguration)
		webView.navigationDelegate = self
		webView.uiDelegate = self
	}
	
	func loadWebContent() {
		let url = URL(string: "https://www.apple.com")
		let request = URLRequest(url: url!)
		webView.load(request)
		
		// Autolayoutを設定
		webView.translatesAutoresizingMaskIntoConstraints = false
		// ジェスチャーを許可
		webView.allowsBackForwardNavigationGestures = true
	}
	
/*
	func webView(_:didCommitNavigation:)	//遷移開始時
	func webView(_:didFailNavigation:withError:)	//遷移中にエラーが発生した時
	func webView(_:didFailProvisionalNavigation:withError:) //ページ読み込み時にエラーが発生した時
	func webView(_:didFinishNavigation:) //ページ読み込みが完了した時
	func webView(_:didReceiveAuthenticationChallenge:completionHandler:) //認証が必要な時
	func webView(_:didReceiveServerRedirectForProvisionalNavigation:) //リダイレクトされた時
	func webView(_:didStartProvisionalNavigation:) //ページ読み込みが開始された時
*/
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {	//Webのロード完了後に実行されるメソッド。WKNavigationDelegateのdelegateを通しておくことを忘れないこと
		_ = webView.title
	}
	
	// target="_blank"なリンクが押されたときに無反応になるので対処
	func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
		guard let url = navigationAction.request.url else {
			return nil
		}
		
		guard let targetFrame = navigationAction.targetFrame, targetFrame.isMainFrame else {
			webView.load(URLRequest(url: url))
			return nil
		}
		return nil
	}
	
}
