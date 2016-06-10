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

class VideoGalleryViewController: UITableViewController, AVPlayerViewControllerDelegate  {
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    // url for playing video
    var videoUrl: NSURL!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "seguePlayVideo" {
            
            // get destination view controller
            let destVc = segue.destinationViewController as! AVPlayerViewController
            
            // set player
            destVc.player = AVPlayer(URL: self.videoUrl)
        }
        
    }

    
    private var videos:[String] = ["video1.mp4", "video2.mp4", "video3.mp4", "video4.mp4"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if prefs.stringForKey("videoGallery") != nil{
            self.title = prefs.stringForKey("videoGallery")
            /*let alertController = UIAlertController(title: "NZTA",
                                                    message: prefs.stringForKey("videoGallery"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style:
                UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion:
                nil)*/
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! VideoGalleryViewCell

        // Configure the cell... 
        cell.eventName?.text = videos[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("playVideo", sender: self)
        // create video url form remote location (i.e. video stored at domain etc.)
        //self.videoUrl = NSURL(string: "http://sdctbheemili.org/ios/\(videos[indexPath.row])")
        self.videoUrl = NSURL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
        
        // perform segue
        self.performSegueWithIdentifier("seguePlayVideo", sender: self)
    }
    

    

}
