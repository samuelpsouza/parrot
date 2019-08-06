//
//  PostTableViewCell.swift
//  parrot
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit
import Reusable

protocol PostTableViewCellDelegate {
    func showAlert(post: PostView)
    func like(post: PostView)
}

class PostTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var ownerProfileImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var dotsImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var timePostLabel: UILabel!
    @IBOutlet weak var heartGreyImageView: UIImageView!
    
    var delegate: PostTableViewCellDelegate!
    var post: PostView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.ownerProfileImageView.layer.cornerRadius = self.ownerProfileImageView.frame.height / 2
        self.ownerProfileImageView.image = Asset.ownerDefault.image
        
        self.heartImageView.image = Asset.heart.image
        self.heartGreyImageView.image = Asset.greyHeart.image
        self.dotsImageView.image = Asset.dots.image
        self.setupAlertSheet()
    }
    
    func bind(post: PostView, delegate: PostTableViewCellDelegate) {
        self.postImageView.image = Asset.postDefault.image
        self.userLabel.text = post.postAuthor.username
        self.messageLabel.text = post.message
        self.delegate = delegate
        self.post = post
        
        if ScreenManager.hideOptions(id: post.postAuthor.id) {
            self.dotsImageView.isHidden = false
        } else {
            self.dotsImageView.isHidden = true
        }
        
        
        if self.post.liked {
            self.heartGreyImageView.isHidden = true
            self.heartImageView.isHidden = false
        }
        
        self.heartGreyImageView.isHidden = false
        self.heartImageView.isHidden = true
    }
    
    func setupAlertSheet() {
        self.dotsImageView.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dotsActions)))
    }
    
    @objc func dotsActions() {
        self.delegate.showAlert(post: self.post)
    }
}
