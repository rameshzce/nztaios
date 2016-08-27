//
//  MessagesViewCell.swift
//  nzta
//
//  Created by Ramesh Kolamala on 27/08/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class MessagesViewCell: UITableViewCell {
    @IBOutlet var mainBg: UIView!
    @IBOutlet var leftSubBg: UIView!
    @IBOutlet var rightSubBg: UIView!
    //@IBOutlet weak var photoGalleryBtn: UIButton!
    //@IBOutlet weak var videoGalleryBtn: UIButton!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var addressLabel:UILabel!
    //@IBOutlet weak var descriptionLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
