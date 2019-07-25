//
//  PostTableViewCell.swift
//  parrot
//
//  Created by administrador on 25/07/19.
//  Copyright © 2019 samuelpsouza. All rights reserved.
//

import UIKit
import Reusable

class PostTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var ownerProfileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.ownerProfileImageView.layer.cornerRadius = self.ownerProfileImageView.frame.height / 2
    }

    func bind(post: PostView) {
        self.postImageView.image = Asset.postDefault.image
    }
}
