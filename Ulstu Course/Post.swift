//
//  Post.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 03/03/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import Foundation

class Post {
    let id: Int
    let userId: Int
    var title: String
    var body: String
    
    init(json: Dictionary<String, Any>) {
        id = json["id"] as! Int
        userId = json["userId"] as! Int
        title = json["title"] as! String
        body = json["body"] as! String
    }
    
    func toJson() -> Dictionary<String, Any> {
        var json = Dictionary<String, Any>()
        json["id"] = id
        json["title"] = title
        json["body"] = body
        json["userId"] = userId
        return json
    }
}
