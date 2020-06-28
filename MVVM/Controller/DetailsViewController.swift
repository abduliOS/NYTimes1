//
//  DetailsViewController.swift
//  NYTimes
//
//  Created by Abdul on 23/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import WebKit


extension DetailsViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.activityInd.isHidden = false
        self.activityInd.startAnimating()
        self.onViewLoadCompleted = true
        print("Started to load")
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityInd.stopAnimating()

        self.activityInd.isHidden = true
        print("Finished loading")
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.activityInd.stopAnimating()
        self.activityInd.isHidden = true
        print(error.localizedDescription)
    }
}

class DetailsViewController: UIViewController {

    @IBOutlet weak var webViewNew: WKWebView!
    @IBOutlet weak var activityInd: UIActivityIndicatorView!

    private(set) var onViewLoad = false
    private(set) var onViewLoadCompleted = false
    var loadURL : String = ""
    var titleNav : String = "Details"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURLString = loadURL
        let url = URL(string: myURLString)
        let request = URLRequest(url: url!)
        self.navigationItem.title = titleNav
        webViewNew.navigationDelegate = self
        webViewNew.load(request)
        onViewLoad = true

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
                self.navigationController?.navigationBar.isHidden = false

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
