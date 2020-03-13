//
//  DetailViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 03/03/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    var postId: Int?
    var realm: Realm { return try! Realm() }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let post = realm.object(ofType: Post.self, forPrimaryKey: postId)
        
        titleTextField.text = post?.title
        bodyTextView.text = post?.body
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        guard let post = realm.object(ofType: Post.self, forPrimaryKey: postId) else {
            return
        }
        
        try! realm.write {
            realm.delete(post)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
