//
//  User.swift
//  TeamFit
//
//  Created by Patrick Mathieu on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

import Foundation

class User {
    var id:Int
    var name:String
    var age:Int
    var sex:String
    var height:Int
    var weight:Int
    
    init(id:Int, name:String, age:Int, sex:String, height:Int, weight:Int) {
        self.id = id
        self.name = name
        self.age = age
        self.sex = sex
        self.height = height
        self.weight = weight
    }
    
    func toJSON() -> String {
        return "{\"User\":{\"id\":\(id),\"name\":\"\(name)\",\"age\":\"\(age)\",\"sex\":\"\(sex)\",\"height\":\"\(height)\",\"weight\":\"\(weight)\"}}"
    }
}
