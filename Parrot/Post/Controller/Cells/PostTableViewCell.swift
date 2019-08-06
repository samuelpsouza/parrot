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
    func deslike(post: PostView)
}

class PostTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var ownerProfileImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var dotsImageView: UIImageView!
    @IBOutlet weak var timePostLabel: UILabel!
    @IBOutlet weak var heartGreyImageView: UIImageView!
    @IBOutlet weak var countLikesLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
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
        self.setupLikeAction()
    }
    
    func bind(post: PostView, delegate: PostTableViewCellDelegate) {
        self.post = post
        self.postImageView.image = Asset.postDefault.image
        self.userLabel.text = self.post.postAuthor.username
        self.messageLabel.text = self.post.message
        self.countLikesLabel.text = String(self.post.likes)
        self.delegate = delegate
        
        
        if ScreenManager.hideOptions(id: self.post.postAuthor.id) {
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
        self.dotsImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dotsActions)))
    }
    
    func setupLikeAction() {
        self.heartImageView.isUserInteractionEnabled = true
        self.heartGreyImageView.isUserInteractionEnabled = true
        
        self.heartImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.like)))
        
        self.heartGreyImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.deslike)))
    }
    
    @objc func dotsActions() {
        self.delegate.showAlert(post: self.post)
    }
    
    @objc func like() {
        self.delegate.like(post: self.post)
    }
    
    @objc func deslike() {
        self.delegate.deslike(post: self.post)
    }
}
