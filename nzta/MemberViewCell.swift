//
//  MemberViewCell.swift
//  nzta
//
//  Created by Ramesh Kolamala on 15/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class MemberViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleBigLabel: UILabel!
    @IBOutlet var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}