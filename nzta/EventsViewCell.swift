//
//  EventsViewCell.swift
//  nzta
//
//  Created by Ramesh Kolamala on 21/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class EventsViewCell: UITableViewCell {
    var isObserving = false;
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var titleBg: UIView!
    @IBOutlet var bottomBg: UIView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var textBg: UIView!

    @IBOutlet var icon: UIImageView!
    class var expandedHeight: CGFloat { get { return 380 } }
    @IBOutlet var imgr: UIImageView!
    class var defaultHeight: CGFloat  { get { return 44  } }

    func checkHeight() {
        imgr.hidden = (frame.size.height < EventsViewCell.expandedHeight)
        textView.hidden = (frame.size.height < EventsViewCell.expandedHeight)
        bottomBg.hidden = (frame.size.height < EventsViewCell.expandedHeight)
        textBg.hidden = (frame.size.height < EventsViewCell.expandedHeight)
    }

func watchFrameChanges() {
    if !isObserving {
        addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.New, NSKeyValueObservingOptions.Initial], context: nil)
        isObserving = true;
    }
}

func ignoreFrameChanges() {
    if isObserving {
        removeObserver(self, forKeyPath: "frame")
        isObserving = false;
    }
}

override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    if keyPath == "frame" {
        checkHeight()
    }
}
}

/*class EventsViewCell: UITableViewCell {
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

}*/
