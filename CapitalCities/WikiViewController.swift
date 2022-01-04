//
//  WikiViewController.swift
//  CapitalCities
//
//  Created by Николай Никитин on 04.01.2022.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {

  var webView: WKWebView!
  var wiki: String!

  override func loadView() {
    webView = WKWebView()
    view = webView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      guard let wiki = URL(string: wiki) else { return }
      webView.load(URLRequest(url: wiki))
    }

}
