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
    
    let prefs = UserDefaults.standard
    
    var galleryImage = "1"
    var url: String!
    var eventName: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        eventName = "images/"
        
        if (prefs.string(forKey: "eventName") == "Ugadi"){
            eventName = "ugadi/"
        } else if (prefs.string(forKey: "eventName") == "Sankranthi"){
            eventName = "sankranti/"
        } else if (prefs.string(forKey: "eventName") == "Holi Funday"){
            eventName = "holi/"
        } else if (prefs.string(forKey: "eventName") == "Vinayaka Chaviti"){
            eventName = "vinayaka/"
        } else if (prefs.string(forKey: "eventName") == "Blood Donations"){
            eventName = "blood_donation/"
        } else if (prefs.string(forKey: "eventName") == "Batukamma"){
            eventName = "batukamma/"
        } else if (prefs.string(forKey: "eventName") == "Calender Inauguration"){
            eventName = "calendar/"
        } else if (prefs.string(forKey: "eventName") == "Blood Donations"){
            eventName = "blood_donation/"
        } else if (prefs.string(forKey: "eventName") == "Blood Donations"){
            eventName = "blood_donation/"
        } else if (prefs.string(forKey: "eventName") == "Blood Donations"){
            eventName = "blood_donation/"
        } else if (prefs.string(forKey: "eventName") == "Blood Donations"){
            eventName = "blood_donation/"
        } else if (prefs.string(forKey: "eventName") == "Blood Donations"){
            eventName = "blood_donation/"
        }
        
        url = "http://sdctbheemili.org/ios/events/" + eventName + "image" + galleryImage + ".jpg"
        
        //imageView.image = UIImage(named: galleryImage)
        imageView.sd_setImage(with: URL(string: url as String), placeholderImage: UIImage(named: "placeholder"))
        
        self.scrollView.minimumZoomScale = 1.0;
        self.scrollView.maximumZoomScale = 6.0;
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return self.imageView
    }
    
}
