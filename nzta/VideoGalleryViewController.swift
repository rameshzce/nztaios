//
//  VideoGalleryViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 22/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class VideoGalleryViewController: UITableViewController {
    
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if prefs.stringForKey("videoGallery") != nil{
            let alertController = UIAlertController(title: "NZTA",
                                                    message: prefs.stringForKey("videoGallery"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style:
                UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion:
                nil)
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
        return events.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! VideoGalleryViewCell

        // Configure the cell...

        return cell
    }
    

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
