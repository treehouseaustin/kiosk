//
//  ViewController.swift
//  Kiosk
//
//  Created by Albert Martin on 8/25/16.
//  Copyright © 2016 TreeHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var webView:UIWebView?

  override func prefersStatusBarHidden() -> Bool {
    return true
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    webView?.backgroundColor = UIColor.init(red: 32 / 255, green: 48 / 255, blue: 55 / 255, alpha: 1)
    webView?.opaque = false
    webView?.scrollView.bounces = false

    let url = NSUserDefaults.standardUserDefaults().stringForKey("url")
    if (url != nil) {
      webView?.loadRequest(self.loadUrl(url!))
      return
    }

    webView?.loadRequest(self.loadUrl("https://tree.house"))
  }

  func checkLoadedState() {
    let loadedUrl: NSString? = webView?.request?.URL?.absoluteString
    let configuredUrl: String? = NSUserDefaults.standardUserDefaults().stringForKey("url")

    if (loadedUrl != nil && configuredUrl != nil && !(loadedUrl!.isEqualToString(configuredUrl!))) {
      webView?.loadRequest(self.loadUrl(configuredUrl!))
    }
  }

  func loadUrl(url: String) -> NSURLRequest {
    return NSURLRequest(URL: NSURL(string: url)!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 30.0)
  }

}
