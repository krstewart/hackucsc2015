//
//  FirstViewController.swift
//  TeamFit
//
//  Created by Patrick Mathieu on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var url: NSURL = NSURL(string: "http://www.facebook.com")!
        var request: NSMutableURLRequest = NSMutableURLRequest(URL:url)
        // Data goes here
        var data = "data = something"
        request.HTTPMethod = "POST"
        request.HTTPBody = data.dataUsingEncoding(NSUTF8StringEncoding);
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) in
            println(response)
            if let HTTPResponse = response as? NSHTTPURLResponse {
                let statusCode = HTTPResponse.statusCode
                
                if statusCode == 200 {
                    // Yes, Do something.
                    println("hollaaaaaaa")
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

