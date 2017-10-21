//
//  AboutViewController.swift
//  bullseye
//
//  Created by Neil Houselander on 19/10/2017.
//  Copyright © 2017 Neil Houselander. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            
            if let htmlData = try? Data(contentsOf: url) {
                
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
                webview.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func close() {
        
        dismiss(animated: true, completion: nil)
        
    }


}
