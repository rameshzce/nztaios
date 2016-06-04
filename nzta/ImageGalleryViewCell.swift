//
//  ImageGalleryViewCell.swift
//  nzta
//
//  Created by Ramesh Kolamala on 04/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class ImageGalleryViewCell: UITableViewCell {
    @IBOutlet weak var postImageView:UIImageView!
    @IBOutlet weak var postTitle:UILabel!
    @IBOutlet weak var postAuthor:UILabel!
    @IBOutlet weak var authorImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
        authorImageView.layer.masksToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
