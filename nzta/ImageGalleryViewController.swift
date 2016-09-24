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
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    
    
    var images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
    
    var thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        if prefs.stringForKey("photoGallery") != nil{
            self.title = prefs.stringForKey("photoGallery")
        }
        self.title = prefs.stringForKey("eventName")
        
        if (prefs.stringForKey("eventName") == "Calender Inauguration"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Sankranthi"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Republic Day"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Blood Donations"){
            images = ["img_event_blood_donation1", "img_event_blood_donation2", "img_event_blood_donation3", "img_event_blood_donation4", "img_event_blood_donation5"]
            thumbs = ["thumb_img_event_blood_donation1", "thumb_img_event_blood_donation2", "thumb_img_event_blood_donation3", "thumb_img_event_blood_donation4", "thumb_img_event_blood_donation5"]
        } else if (prefs.stringForKey("eventName") == "Holy Funday"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Ugadi"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Independence Day"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Vinayaka Chaviti"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Batukamma"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Dasara & Diwali"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Vanabojanalu"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Xmas"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        }
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
