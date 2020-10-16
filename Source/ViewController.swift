//
//  ViewController.swift
//  wkwebview-demo-ios
//
//  Created by Stefan Nebel on 16.10.20.
//

import Foundation
import WebKit
import UIKit


// MARK: - REAL DEVICE LOG
/*
wkwebview-demo-ios[14975:3796254] WF: === Starting WebFilter logging for process wkwebview-demo-ios
wkwebview-demo-ios[14975:3796254] WF: _userSettingsForUser mobile: {
    filterBlacklist =     (
    );
    filterWhitelist =     (
    );
    restrictWeb = 1;
    useContentFilter = 0;
    useContentFilterOverrides = 0;
    whitelistEnabled = 0;
}
wkwebview-demo-ios[14975:3796254] WF: _WebFilterIsActive returning: NO
*/


class ViewController: UIViewController {

  private let viewModel: ViewModel
  private let webView: WKWebView = {
    var configuration = WKWebViewConfiguration()
    let view = WKWebView(frame: .zero, configuration: configuration)
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    return view
  }()

  init(viewModel: ViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    webView.frame = view.frame
    view.addSubview(webView)

    let html = fullHTML(from: viewModel.htmlText)
    webView.loadHTMLString(html, baseURL: nil)
  }

  private func fullHTML(from bodyHtml: String) -> String {
    return """
    <HTML style=\"-webkit-text-size-adjust: none;\">
    <HEAD>
    <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
    </HEAD>
    <BODY>\(bodyHtml)</BODY>
    </HTML>
    """
  }
}
