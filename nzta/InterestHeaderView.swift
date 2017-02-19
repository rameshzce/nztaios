//
//  InterestHeaderView.swift
//  nzta
//
//  Created by Ramesh Kolamala on 13/09/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class InterestHeaderView: UIView
{
    // MARK: - Public API
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI()
    {
        backgroundImageView?.image! = interest.featuredImage
        //interestTitleLabel?.text! = interest.title
        //numberOfMembersLabel.text! = "\(interest.numberOfMembers)"
        //numberOfPostsLabel.text! = "\(interest.numberOfPosts)"
        //pullDownToCloseLabel.text! = "Pull down to close"
        //pullDownToCloseLabel.hidden = true
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    @IBOutlet weak var numberOfMembersLabel: UILabel!
    @IBOutlet weak var numberOfPostsLabel: UILabel!
    @IBOutlet weak var pullDownToCloseLabel: UILabel!
    @IBOutlet weak var closeButtonBackgroundView: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //closeButtonBackgroundView.layer.cornerRadius = closeButtonBackgroundView.bounds.width / 2
        //closeButtonBackgroundView.layer.masksToBounds = true
    }
}
