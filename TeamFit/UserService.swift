//
//  UserService.swift
//  TeamFit
//
//  Created by Patrick Mathieu on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

import UIKit

class UserService {
    var dataAccess:DataAccess!
    
    init() {
        self.dataAccess = DataAccess()
    }
    
    func getUsers(callback:(NSDictionary) -> ()) {
        request(dataAccess.viewUsers, callback: callback)
    }
    
    func request(url:String, callback:(NSDictionary) -> ()) {
        var nsURL = NSURL(string: url)
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL!) {
            (data, response, error) in
            var error:NSError?
            var response = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
            callback(response)
        }
        task.resume()
    }
}
