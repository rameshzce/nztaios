//
//  ImageGalleryViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 04/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class ImageGalleryViewController: UITableViewController {
    var eventName: String!
    
    let images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
    
    let thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
    
    let prefs = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        if prefs.stringForKey("photoGallery") != nil{
            self.title = prefs.stringForKey("photoGallery")
        }
        self.title = prefs.stringForKey("eventName")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return images.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ImageGalleryViewCell
        
        
        
        cell.postImageView.image = UIImage(named: thumbs[indexPath.row])
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "displayGalleryImage" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as!
                ScrollViewController
                destinationController.galleryImage =
                    images[indexPath.row]
            }
        }
    }
    
}
