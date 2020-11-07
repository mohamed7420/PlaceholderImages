//
//  PostTableViewCell.swift
//  PlaceholderImages
//
//  Created by Mohamed on 11/7/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit
import SDWebImage

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewPosts: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    
    func set(post: PostResponse){
        
        imageViewPosts.sd_setImage(with: URL(string: post.thumbnailUrl!)) { (image, error, cache, url) in
            
            if let _ = error{
                
                print(error!.localizedDescription)
            }
        }
        
        labelTitle.text = post.title
    }
    
}
