//
//  TableViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 03/03/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var realm: Realm { return try! Realm() }
    var posts = Array<Post>()
    var selectedPostId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.posts = Array(self.realm.objects(Post.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        posts = Array(realm.objects(Post.self))
        tableView.reloadData()
    }
    
    func addToRealm(postsArr: [Post]) {
        do {
            try realm.write {
                realm.add(postsArr, update: .modified)
            }
        } catch {
            print(error)
        }
    }
    
    func mapping(jsonValues: Array<Any>) -> [Post] {
        var resultArray = Array<Post>()
        
        let firstFiveObjects = jsonValues.prefix(5)
        
        for element in firstFiveObjects {
            let post = Post()
            post.decode(from: element as! Dictionary<String, Any>)
            resultArray.append(post)
        }
        
        return resultArray
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPostId = posts[indexPath.row].id
        performSegue(withIdentifier: "GoToDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellreuseId", for: indexPath)

        cell.textLabel?.text = posts[indexPath.row].title

        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            vc.postId = selectedPostId
        }
    }
}
