//
//  VideoGalleryViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 22/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

    
class VideoGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, AVPlayerViewControllerDelegate {
        @IBOutlet weak var backgroundImageView:UIImageView!
        @IBOutlet var collectionView:UICollectionView!
        
        let prefs = NSUserDefaults.standardUserDefaults()
        
        private var trips = [Trip(city: "event name", featuredImage: UIImage(named: "event_name_image1")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image2")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image3")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image4")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image5")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image6")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image7")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image8")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image9")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image10")),
                             Trip(city: "event name", featuredImage: UIImage(named: "event_name_image11"))
        ]
        
        // url for playing video
        var videoUrl: NSURL!
        
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
            if segue.identifier == "seguePlayVideo1" {
                
                // get destination view controller
                let destVc = segue.destinationViewController as! AVPlayerViewController
                
                // set player
                destVc.player = AVPlayer(URL: self.videoUrl)
            }
            
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Apply blurring effect
            backgroundImageView.image = UIImage(named: "cloud")
            let blurEffect = UIBlurEffect(style: .Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            backgroundImageView.addSubview(blurEffectView)
            
            collectionView.backgroundColor = UIColor.clearColor()
            
            // Change the height for 3.5-inch screen
            if UIScreen.mainScreen().bounds.size.height == 480.0 {
                let flowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
                flowLayout.itemSize = CGSizeMake(250.0, 300.0)
            }
            
            if prefs.stringForKey("videoGallery") != nil{
                self.title = prefs.stringForKey("videoGallery")
                /*let alertController = UIAlertController(title: "NZTA",
                 message: prefs.stringForKey("videoGallery"), preferredStyle: UIAlertControllerStyle.Alert)
                 alertController.addAction(UIAlertAction(title: "OK", style:
                 UIAlertActionStyle.Default, handler: nil))
                 self.presentViewController(alertController, animated: true, completion:
                 nil)*/
            }
            self.title = prefs.stringForKey("eventName")
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        override func preferredStatusBarStyle() -> UIStatusBarStyle {
            return UIStatusBarStyle.LightContent
        }
        
        // MARK: - UICollectionView Delegate Methods
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return trips.count
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! VideoGalleryViewCell
            
            // Configure the cell
            cell.cityLabel.text = trips[indexPath.row].city
            cell.imageView.image = trips[indexPath.row].featuredImage
            
            // Apply round corner
            cell.layer.cornerRadius = 4.0
            
            return cell
        }
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            
            self.videoUrl = NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
            
            // perform segue
            self.performSegueWithIdentifier("seguePlayVideo1", sender: self)
        }
        
    
}
