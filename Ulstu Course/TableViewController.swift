//
//  TableViewController.swift
//  Ulstu Course
//
//  Created by Antol Peshkov on 03/03/2020.
//  Copyright © 2020 Mad Brains. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var posts = Array<Post>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonValues = try! JSONSerialization.jsonObject(with: data!) as! Array<Any>
            self.posts = self.mapping(jsonValues: jsonValues)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        task.resume()
    }
    
    func mapping(jsonValues: Array<Any>) -> [Post] {
        var resultArray = Array<Post>()
        
        for element in jsonValues {
            let post = Post(json: element as! Dictionary<String, Any>)
            resultArray.append(post)
        }
        
        return resultArray
    }

    // MARK: - Table view data source

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
            vc.post = posts[tableView.indexPathForSelectedRow!.row]
        }
    }
}
