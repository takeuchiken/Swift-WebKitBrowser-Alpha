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
	
	// webViewの生成
	func loadWebView() {
		
		let webConfiguration = WKWebViewConfiguration()
		webView = WKWebView(frame: .zero, configuration: webConfiguration)
		webView.navigationDelegate = self
		webView.uiDelegate = self
		
		print("WebViewController.loadWebView Finished")
	}
	
	// URLの登録から読み込み開始とレイアウトおよび操作の設定
	func loadWebContents() {
		
		let url = URL(string: "https://www.apple.com")
		//let url = URL(string: "https://www.sketchappsources.com/rss.xml")
		let request = URLRequest(url: url!)
		webView.load(request)
		
		// Autolayoutを設定
		webView.translatesAutoresizingMaskIntoConstraints = false
		// ジェスチャーを許可
		webView.allowsBackForwardNavigationGestures = true
		
		print("WebViewController.loadWebContents Finished")
	}
	
	// Web遷移〜ページ読み込み〜ページ読み込み完了の一連のタイミングごとに呼ばれる関数。WKNavigationDelegateのdelegateを通しておくことを忘れないこと
	func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {	}	//遷移開始時
	func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {	}	//サーバーリダイレクトされた時
	func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {	}	//遷移中にエラーが発生した時
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {	}	//ページ読み込みが開始された時
	func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {	}	//ページ読み込み時にエラーが発生した時
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {	//Web//ページ読み込みが完了した時。
	
		_ = webView.title
	
		print("WebViewController.webView didFinished Finished")
	}
//	func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {	}	//認証が必要な時(エラー発生のためコメントアウト)
	func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {	}	//ページ読み込みが中止された時
	
		// target="_blank"なリンクが押されたときに無反応になるので対処
	func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {

		guard let url = navigationAction.request.url else {
			return nil
		}
		
		guard let targetFrame = navigationAction.targetFrame, targetFrame.isMainFrame else {
			webView.load(URLRequest(url: url))
			return nil
		}
		
		print("WebViewController.webView createWebViewWith configuration for navigationAction windowFeatures Finished")
		return nil
		
	}
	
	func goBack() {
		if (self.webView.canGoBack) {
			self.webView.goBack()
		} else {
			// canGoBack == false の処理
		}
	}
	
	func goForward() {
		if (self.webView.canGoForward) {
			self.webView.goForward()
		} else {
			// canGoForward == false の処理
		}
	}
	
	
}
