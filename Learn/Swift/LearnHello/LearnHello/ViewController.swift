//
//  ViewController.swift
//  LearnHello
//
//  Created by WangChao on 6/18/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonpress(sender: AnyObject) {
    }
    @IBOutlet var web:UIWebView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        web.loadRequest(NSURLRequest(URL:NSURL(string:"http://www.baidu.com")))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

