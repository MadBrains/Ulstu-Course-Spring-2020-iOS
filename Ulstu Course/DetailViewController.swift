//
//  DetailViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 03/03/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var post: Post?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = post?.title
        bodyTextView.text = post?.body
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        //на практике забыли применить изменение из текстовых полей
        //для этого еще надо поменять объявление свойств title и body в
        //классе Post с let на var
        post?.title = titleTextField.text!
        post?.body = bodyTextView.text!
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(post!.id)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let httpBody = try! JSONSerialization.data(withJSONObject: post!.toJson())
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(error)
            print(String(data: data!, encoding: .utf8)!)
        }
        task.resume()
    }

}
