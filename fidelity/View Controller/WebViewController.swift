//
//  WebViewController.swift
//  fidelity
//
//  Created by Aaron Levy on 4/23/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, APIHandler {
    
    
    let vm = WebViewModel()
    var websiteURL: String?
    
    @IBOutlet weak var websiteView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //transfers website url to view model
        vm.webPageURL = websiteURL
        
        
        //sets view to the web page
        if let urlRequest = getURLRequest(urlString: vm.webPageURL ?? "") {
            websiteView.load(urlRequest)
        }
        
        
    }
    

    

}
