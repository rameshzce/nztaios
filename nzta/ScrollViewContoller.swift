//
//  ScrollViewContoller.swift
//  nzta
//
//  Created by Ramesh Kolamala on 24/09/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate
{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var galleryImage = "pug"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageView.image = UIImage(named: galleryImage)
        
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
