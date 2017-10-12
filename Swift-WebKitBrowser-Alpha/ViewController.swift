//
//  ViewController.swift
//  Swift-WebKitBrowser-Alpha
//
//  Created by 竹内健 on 2017/10/11.
//  Copyright © 2017年 竹内健. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var wk = WebViewController()
	@IBOutlet weak var toolbar: UIToolbar!
	@IBAction func backButton(_ sender: Any) {
	}
	@IBAction func forwardButton(_ sender: Any) {
	}
	
	override func loadView() {
		super.loadView()
		
		
		print("ViewController.loadView Finished")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		wk.loadWebView()
		// webViewが入るframeをviewのframeに指定
		wk.webView.frame = view.frame
		// 親ViewにWKWebViewを追加
		view.addSubview(wk.webView)
		// WKWebViewを最背面に移動
		view.sendSubview(toBack: wk.webView)
		
		wk.loadWebContents()
		
		print("ViewController.viewDidLoad Finished")
	}

	override func viewDidDisappear(_ animated: Bool) {

		
		print("ViewController.viewDidDisappear Finished")
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	func toolbarLooks() {
		self.toolbar.layer.cornerRadius = 5	// 角丸のサイズ
		self.toolbar.layer.borderWidth = 2.0	// 枠線の幅
		self.toolbar.backgroundColor = UIColor.lightGray	// 背景色
		self.toolbar.layer.borderColor = UIColor.red.cgColor	// 枠線の色

	}
	
	
}

// 「Storyboard」でボタン枠の色を変える方法
// StoryboardでKeyPathにlayer.borderUIColorを入力し、Colorで選択する。
// <https://news.d-lighted.jp/blog-staff/storyboard>
extension CALayer {
	func setBorderUIColor(_ color: UIColor) {
		self.borderColor = color.cgColor
	}
}
