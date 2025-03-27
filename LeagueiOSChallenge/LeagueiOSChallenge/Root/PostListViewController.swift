//
//  LoginResponse.swift
//  LeagueiOSChallenge
//
//  Copyright © 2024 League Inc. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var posts: [Post] = []
    private let apiKey: String  // Store API Key
    
    init(apiKey: String) {
        self.apiKey = apiKey
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(PostCell.self, forCellReuseIdentifier: PostCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        fetchPosts()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchPosts() {
        Task {
            do {
                self.posts = try await PostService().fetchPosts(apiKey: apiKey) // Pass API Key
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Failed to fetch posts")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as! PostCell
        cell.configure(with: posts[indexPath.row])
        return cell
    }
}
