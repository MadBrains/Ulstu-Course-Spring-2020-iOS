//
//  Post.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 03/03/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var userId: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var body: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func decode(from dictionary: Dictionary<String, Any>) {
        id = dictionary["id"] as! Int
        userId = dictionary["userId"] as! Int
        title = dictionary["title"] as! String
        body = dictionary["body"] as! String
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
