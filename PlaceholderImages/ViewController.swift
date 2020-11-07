//
//  ViewController.swift
//  PlaceholderImages
//
//  Created by Mohamed on 11/6/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let postsAPI: PostsAPIDelegate = PostsAPI()
    
    private var posts = [PostResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPosts()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        tableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDataSource , UITableViewDelegate{
    
    func getPosts(){
        
        postsAPI.getPosts { (response) in
            
            switch response{
                
            case .success(let posts):
                
                let newPosts = posts ?? []
                self.posts = newPosts
                print(self.posts)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        
        cell.set(post: posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
