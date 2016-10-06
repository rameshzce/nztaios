//
//  ImageGalleryViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 04/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit
import SDWebImage

class ImageGalleryViewController: UITableViewController {
    var eventName: String!
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    var array:NSArray!
    
    var url: String!
    
    
    var images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
    
    var thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = "http://sdctbheemili.org/ios/events/"
        
        array = NSArray(objects:
            url + "images/thumb1.jpg",
            url + "images/thumb2.jpg",
            url + "images/thumb3.jpg",
            url + "images/thumb4.jpg",
            url + "images/thumb5.jpg",
            url + "images/thumb6.jpg",
            url + "images/thumb7.jpg",
            url + "images/thumb8.jpg",
            url + "images/thumb9.jpg",
            url + "images/thumb10.jpg",
            url + "images/thumb11.jpg"
        );
        
        if (prefs.stringForKey("eventName") == "Ugadi"){
            array = NSArray(objects:
                url + "ugadi/thumb1.png",
                url + "ugadi/thumb2.png",
                url + "ugadi/thumb3.png",
                url + "ugadi/thumb4.png",
                url + "ugadi/thumb5.png",
                url + "ugadi/thumb6.png",
                url + "ugadi/thumb7.png",
                url + "ugadi/thumb8.png",
                url + "ugadi/thumb9.png",
                url + "ugadi/thumb10.png",
                url + "ugadi/thumb11.png",
                url + "ugadi/thumb12.png",
                url + "ugadi/thumb13.png",
                url + "ugadi/thumb14.png"
            );
        } else if (prefs.stringForKey("eventName") == "Sankranthi"){
            array = NSArray(objects:
                url + "sankranti/thumb1.png",
                url + "sankranti/thumb2.png",
                url + "sankranti/thumb3.png",
                url + "sankranti/thumb4.png",
                url + "sankranti/thumb5.png",
                url + "sankranti/thumb6.png",
                url + "sankranti/thumb7.png",
                url + "sankranti/thumb8.png",
                url + "sankranti/thumb9.png"
            );
        } else if (prefs.stringForKey("eventName") == "Holi Funday"){
            array = NSArray(objects:
                url + "holi/thumb1.png",
                url + "holi/thumb2.png",
                url + "holi/thumb3.png",
                url + "holi/thumb4.png",
                url + "holi/thumb5.png",
                url + "holi/thumb6.png",
                url + "holi/thumb7.png",
                url + "holi/thumb8.png"
            );
        } else if (prefs.stringForKey("eventName") == "Vinayaka Chaviti"){
            array = NSArray(objects:
                url + "vinayaka/thumb1.png",
                url + "vinayaka/thumb2.png",
                url + "vinayaka/thumb3.png",
                url + "vinayaka/thumb4.png",
                url + "vinayaka/thumb5.png",
                url + "vinayaka/thumb6.png",
                url + "vinayaka/thumb7.png",
                url + "vinayaka/thumb8.png",
                url + "vinayaka/thumb9.png",
                url + "vinayaka/thumb10.png",
                url + "vinayaka/thumb11.png",
                url + "vinayaka/thumb12.png",
                url + "vinayaka/thumb13.png"
            );
        } else if (prefs.stringForKey("eventName") == "Blood Donations"){
            array = NSArray(objects:
                url + "blood_donation/thumb1.png",
                url + "blood_donation/thumb2.png",
                url + "blood_donation/thumb3.png",
                url + "blood_donation/thumb4.png",
                url + "blood_donation/thumb5.png"
            );
        }
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        if prefs.stringForKey("photoGallery") != nil{
            self.title = prefs.stringForKey("photoGallery")
        }
        self.title = prefs.stringForKey("eventName")
        
        if (prefs.stringForKey("eventName") == "Calender Inauguration"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Sankranthi"){
            images = ["img_event_sankranti1", "img_event_sankranti2", "img_event_sankranti3", "img_event_sankranti4", "img_event_sankranti5", "img_event_sankranti6", "img_event_sankranti7", "img_event_sankranti8", "img_event_sankranti9"]
            thumbs = ["thumb_img_event_sankranti1", "thumb_img_event_sankranti2", "thumb_img_event_sankranti3", "thumb_img_event_sankranti4", "thumb_img_event_sankranti5", "thumb_img_event_sankranti6", "thumb_img_event_sankranti7", "thumb_img_event_sankranti8", "thumb_img_event_sankranti9"]
        } else if (prefs.stringForKey("eventName") == "Republic Day"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Blood Donations"){
            images = ["img_event_blood_donation1", "img_event_blood_donation2", "img_event_blood_donation3", "img_event_blood_donation4", "img_event_blood_donation5"]
            thumbs = ["thumb_img_event_blood_donation1", "thumb_img_event_blood_donation2", "thumb_img_event_blood_donation3", "thumb_img_event_blood_donation4", "thumb_img_event_blood_donation5"]
        } else if (prefs.stringForKey("eventName") == "Holi Funday"){
            images = ["img_event_holi1", "img_event_holi2", "img_event_holi3", "img_event_holi4", "img_event_holi5", "img_event_holi6", "img_event_holi7", "img_event_holi8"]
            thumbs = ["thumb_img_event_holi1", "thumb_img_event_holi2", "thumb_img_event_holi3", "thumb_img_event_holi4", "thumb_img_event_holi5", "thumb_img_event_holi6", "thumb_img_event_holi7", "thumb_img_event_holi8"]
        } else if (prefs.stringForKey("eventName") == "Ugadi"){
            images = ["img_event_ugadi1", "img_event_ugadi2", "img_event_ugadi3", "img_event_ugadi4", "img_event_ugadi5", "img_event_ugadi6", "img_event_ugadi7", "img_event_ugadi8", "img_event_ugadi9", "img_event_ugadi10", "img_event_ugadi11", "img_event_ugadi12", "img_event_ugadi13", "img_event_ugadi14"]
            thumbs = ["thumb_img_event_ugadi1", "thumb_img_event_ugadi2", "thumb_img_event_ugadi3", "thumb_img_event_ugadi4", "thumb_img_event_ugadi5", "thumb_img_event_ugadi6", "thumb_img_event_ugadi7", "thumb_img_event_ugadi8", "thumb_img_event_ugadi9", "thumb_img_event_ugadi10", "thumb_img_event_ugadi11", "thumb_img_event_ugadi12", "thumb_img_event_ugadi13", "thumb_img_event_ugadi14"]
        } else if (prefs.stringForKey("eventName") == "Independence Day"){
            images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
            thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
        } else if (prefs.stringForKey("eventName") == "Vinayaka Chaviti"){
            images = ["img_event_vinayaka1", "img_event_vinayaka2", "img_event_vinayaka3", "img_event_vinayaka4", "img_event_vinayaka5", "img_event_vinayaka6", "img_event_vinayaka7", "img_event_vinayaka8", "img_event_vinayaka9", "img_event_vinayaka10", "img_event_vinayaka11", "img_event_vinayaka12", "img_event_vinayaka13"]
            thumbs = ["thumb_img_event_vinayaka1", "thumb_img_event_vinayaka2", "thumb_img_event_vinayaka3", "thumb_img_event_vinayaka4", "thumb_img_event_vinayaka5", "thumb_img_event_vinayaka6", "thumb_img_event_vinayaka7", "thumb_img_event_vinayaka8", "thumb_img_event_vinayaka9", "thumb_img_event_vinayaka10", "thumb_img_event_vinayaka11", "thumb_img_event_vinayaka12", "thumb_img_event_vinayaka13"]
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
        //return images.count
        return array.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ImageGalleryViewCell
        
        
        
        //cell.postImageView.image = UIImage(named: thumbs[indexPath.row])
        cell.postImageView.sd_setImageWithURL(NSURL(string: array.objectAtIndex(indexPath.row) as! String), placeholderImage: UIImage(named: "placeholder"))
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "displayGalleryImage" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as!
                ScrollViewController
                //destinationController.galleryImage = images[indexPath.row]
                destinationController.galleryImage = "\(indexPath.row + 1)"
            }
        }
    }
    
}
