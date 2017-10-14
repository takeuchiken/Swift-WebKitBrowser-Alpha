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
	
//// MARK: - Life cycle events - ////
	// UI 部品を View へセットする場合はこちらをオーバーライドします。ただし、UI 部品のセットはこのメソッドでなくても問題ありません。
	override func loadView() {
		super.loadView()
		print("ViewController.loadView")
	}
	
	// 初期表示時に必要な処理を設定します。
	override func viewDidLoad() {
		super.viewDidLoad()
		print("ViewController.viewDidLoad")
		// Do any additional setup after loading the view, typically from a nib.

		wk.loadWebView()
		// webViewが入るframeをviewのframeに指定
		wk.webView.frame = view.frame
		// 親ViewにWKWebViewを追加
		view.addSubview(wk.webView)
		// WKWebViewを最背面に移動
		view.sendSubview(toBack: wk.webView)
		
		wk.loadWebContents()
		
	}
	
	// 画面に表示される直前に呼ばれます。
	override func viewWillAppear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		print("ViewController.viewWillAppear")
	}
	
	// 画面に表示された直後に呼ばれます。
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print("ViewController.viewDidAppear")
	}
	
	// ビューが再レイアウトされるときに呼び出される
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		print("ViewController.viewWillLayoutSubviews")
		// ランドスケープモード(横)で表示が崩れないようにするために、webViewが入るframeをviewのframeに再指定。
		wk.webView.frame = view.frame
	}
	
	// ビューが再レイアウトされたときに呼び出される
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		print("ViewController.viewDidLayoutSubviews")
	}
	
	// 画面から非表示になる直前に呼ばれます。
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		print("ViewController.viewWillDisappear")
	}
	
	// 画面から非表示になる直後に呼ばれます。
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		print("ViewController.viewDidDisappear")
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
		print("ViewController.didReceiveMemoryWarning")
	}
	
	
	func toolbarLooks() {
		self.toolbar.layer.cornerRadius = 5	// 角丸のサイズ
		self.toolbar.layer.borderWidth = 2.0	// 枠線の幅
		self.toolbar.backgroundColor = UIColor.lightGray	// 背景色
		self.toolbar.layer.borderColor = UIColor.red.cgColor	// 枠線の色

	}
	
	
}

/*
// 「Storyboard」でボタン枠の色を変える方法
// StoryboardでKeyPathにlayer.borderUIColorを入力し、Colorで選択する。
// <https://news.d-lighted.jp/blog-staff/storyboard>
extension CALayer {
	func setBorderUIColor(_ color: UIColor) {
		self.borderColor = color.cgColor
	}
}
*/
