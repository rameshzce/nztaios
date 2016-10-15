//
//  MenuViewCell.swift
//  nzta
//
//  Created by Ramesh Kolamala on 24/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet var menuIcon: UIImageView!
    @IBOutlet var menuBg: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
