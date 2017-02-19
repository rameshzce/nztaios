//
//  SponsorsViewCell.swift
//  nzta
//
//  Created by Ramesh Kolamala on 10/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class SponsorsViewCell: UITableViewCell {

    @IBOutlet var companyName: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var sponsorLogo: UIImageView!
    
    override func awakeFromNib() {
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
