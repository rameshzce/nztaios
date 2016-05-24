//
//  EventsViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 21/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class EventsViewController: UITableViewController {
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    private var events:[(name: String, address: String)] = [
        ("Sankranti", "Rangoli competition & kite festival on 17-1-2016"),
        ("Ugadi", "Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner "),
        ("Batukamma", "War memorial hall, Mount eden on 1-6-2016 Friday 6.00pm, all are welcome and followed by dinner."),
        ("Diwali", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed"),
        ("X'mas", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner."),
        ("Sankranti", "Rangoli competition & kite festival on 17-1-2016"),
        ("Ugadi", "Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner "),
        ("Batukamma", "War memorial hall, Mount eden on 1-6-2016 Friday 6.00pm, all are welcome and followed by dinner."),
        ("Diwali", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed"),
        ("X'mas", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner.")
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 95.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = hexStringToUIColor("#ff218e")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return events.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EventsViewCell
        
        // Configure the cell...
        let event = events[indexPath.row]
        cell.nameLabel.text = event.name
        cell.addressLabel.text = event.address
        
        /*cell.photoGalleryBtn.tag = indexPath.row
        cell.photoGalleryBtn.addTarget(self, action: #selector(EventsViewController.logAction), forControlEvents: .TouchUpInside)
        
        cell.videoGalleryBtn.tag = indexPath.row
        cell.videoGalleryBtn.addTarget(self, action: #selector(EventsViewController.logAction2), forControlEvents: .TouchUpInside)
        */
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        //cell.backgroundColor = hexStringToUIColor("#ff0000")
    }
    
    @IBAction func logAction(sender: UIButton) {
        let event = self.events[sender.tag]
        
        let eventName = "\(event.name)"
        
        self.prefs.setValue(eventName, forKey: "photoGallery")
        
        /*let alertController = UIAlertController(title: "NZTA",
                                                message: eventName, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style:
            UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion:
            nil)*/
        
        //let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [eventName], applicationActivities: nil)
        
        //self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func logAction2(sender: UIButton) {
        let event = self.events[sender.tag]
        
        let eventName = "\(event.name)"
        
        self.prefs.setValue(eventName, forKey: "videoGallery")
        
        /*let alertController = UIAlertController(title: "NZTA",
         message: eventName, preferredStyle: UIAlertControllerStyle.Alert)
         alertController.addAction(UIAlertAction(title: "OK", style:
         UIAlertActionStyle.Default, handler: nil))
         self.presentViewController(alertController, animated: true, completion:
         nil)*/
        
        //let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [eventName], applicationActivities: nil)
        
        //self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    /*override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("photoGallery", sender: self)
    }*/
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == "photoGallery")
        {
            let upcoming: PhotoGalleryViewController = segue.destinationViewController as! PhotoGalleryViewController
            
            let indexPath = tableView.indexPathForSelectedRow!
            
            //let eventName = self.objects.objectAtIndex(indexPath.row) as? String
            let eventName = self.events[indexPath.row]
            
            upcoming.eventName = eventName.name
            
        }
    }*/
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
