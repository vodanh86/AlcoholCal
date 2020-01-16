//
//  Copyright (C) 2015 Google, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import GoogleMobileAds
import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate, WKUIDelegate{

  /// The banner view.
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var bannerView: GADBannerView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let htmlPath = Bundle.main.path(forResource: "www/index", ofType: "html")
    let url = URL(fileURLWithPath: htmlPath!)
    let request = URLRequest(url: url)
    
    // 1
    webView.uiDelegate = self
    webView.navigationDelegate = self
    webView.load(request)
    navigationController?.isToolbarHidden = false
    
    bannerView.adUnitID = "ca-app-pub-3506360182754935/4083526491"
    bannerView.rootViewController = self
    bannerView.load(GADRequest())
    
  }

    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String,
                 initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {

        let alertController = UIAlertController(title: message, message: nil,
                                                preferredStyle: UIAlertController.Style.alert);

        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) {
            _ in completionHandler()}
        );

        self.present(alertController, animated: true, completion: {});
    }
    
}
