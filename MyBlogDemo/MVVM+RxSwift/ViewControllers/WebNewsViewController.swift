//
//  WebNewsViewController.swift
//  MyBlogDemo
//
//  Created by Tianchi Wang on 2019/4/20.
//  Copyright © 2019 Tianchi Wang. All rights reserved.
//

import UIKit
import WebKit

class WebNewsViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var vm: NewsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let newsURLStr = vm?.newsUrlString, let newsURL = URL(string: newsURLStr) {
            let request = URLRequest(url:newsURL)
            webView.load(request)
        }
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
