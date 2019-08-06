//
//  PostsViewController.swift
//  parrot
//
//  Created by SAMUEL PEREIRA DE SOUZA on 24/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit
import SVProgressHUD

class PostsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var postTextView: UITextView!
    
    var service: PostService!
    var posts: [PostView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.service = PostService.init(delegate: self)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(cellType: PostTableViewCell.self)
        self.tableView.estimatedRowHeight = 500
        
        self.ownerImageView.image = Asset.ownerDefault.image
        
        self.postView.layer.cornerRadius = 10
        self.setTextFieldPlaceholder()
        
        self.postTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    
    fileprivate func post() {
        self.service.postPost(post: self.postTextView.text)
        self.setTextFieldPlaceholder()
    }
    
    fileprivate func loadData(){
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show()
        self.service.getPosts(page: 1)
    }
    
    fileprivate func setTextFieldPlaceholder(){
        self.postTextView.text = "O que vc esta sentindo?"
        self.postTextView.textColor = UIColor.lightGray
    }

}

extension PostsViewController: PostServiceDelegate {
    func success() {
        self.posts = PostViewModel.getPosts()
        self.tableView.reloadData()
        SVProgressHUD.dismiss()
    }
    
    func failure(error: String) {
        print(error)
        SVProgressHUD.dismiss()
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PostTableViewCell
        cell.bind(post: self.posts[indexPath.row], delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

extension PostsViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
           self.setTextFieldPlaceholder()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            self.post()
        }
        return true
    }
}

extension PostsViewController: PostTableViewCellDelegate {

    func showAlert(post: PostView) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        // 2
        let editAction = UIAlertAction(title: "Edit", style: .default)
        let deleteAction = UIAlertAction(title: "Delete", style: .default){ (action) in
            self.service.deletePost(post: post)
        }
        
        // 3
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // 4
        optionMenu.addAction(editAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func like(post: PostView) {
        self.service.postLike(post: post)
    }
    
    func deslike(post: PostView) {
        self.service.deleteLike(post: post)
    }
    
}
