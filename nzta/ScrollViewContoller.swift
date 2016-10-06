//
//  ScrollViewContoller.swift
//  nzta
//
//  Created by Ramesh Kolamala on 24/09/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit
import SDWebImage

class ScrollViewController: UIViewController, UIScrollViewDelegate
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    var galleryImage = "1"
    var url: String!
    var eventName: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        eventName = "images/"
        
        if (prefs.stringForKey("eventName") == "Ugadi"){
            eventName = "ugadi/"
        } else if (prefs.stringForKey("eventName") == "Sankranthi"){
            eventName = "sankranti/"
        } else if (prefs.stringForKey("eventName") == "Holi Funday"){
            eventName = "holi/"
        } else if (prefs.stringForKey("eventName") == "Vinayaka Chaviti"){
            eventName = "vinayaka/"
        } else if (prefs.stringForKey("eventName") == "Blood Donations"){
            eventName = "blood_donation/"
        }
        
        url = "http://sdctbheemili.org/ios/events/" + eventName + "image" + galleryImage + ".jpg"
        
        //imageView.image = UIImage(named: galleryImage)
        imageView.sd_setImageWithURL(NSURL(string: url as String), placeholderImage: UIImage(named: "placeholder"))
        
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.imageView
    }
    
}
