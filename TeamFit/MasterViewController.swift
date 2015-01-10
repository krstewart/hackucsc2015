//
//  MasterViewController.swift
//  TeamFit
//
//  Created by Patrick Mathieu on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    var usersCollection = [User]()
    var service:UserService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        service = UserService()
        service.getUsers {
            (response) in
            self.loadUsers(response["user"]! as NSArray)
        }
    }
    
    func loadUsers(users:NSArray) {
        for user in users {
            var user = user["User"]! as NSDictionary
            var id = (user["id"]! as String).toInt()!
            var name = user["name"]! as String
            var age = (user["age"]! as String).toInt()!
            var sex = user["sex"]! as String
            var height = (user["height"]! as String).toInt()!
            var weight = (user["weight"]! as String).toInt()!
            var userObject = User(id: id, name: name, age: age, sex: sex, height: height, weight: weight)
            usersCollection.append(userObject)
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }
    }
}
