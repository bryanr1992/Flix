//
//  WebViewController.swift
//  Flix
//
//  Created by Bryan Rivas on 10/25/19.
//  Copyright © 2019 Bryan Rivas. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var key = String()

    @IBOutlet var webPlayer: WKWebView!
    
    override func loadView(){
        let webConfiguration = WKWebViewConfiguration()
        webPlayer = WKWebView(frame: .zero, configuration: webConfiguration)
        webPlayer.uiDelegate = self
        view = webPlayer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.youtube.com/watch?v=\(key)")
        let myRequest = URLRequest(url: myURL!)
        webPlayer.load(myRequest)
        
    
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
