//
//  MessagesTableViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 27/08/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class MessagesTableViewController: UITableViewController {
    var mainViewcolor = "#ff218e"
    var mainBgcolor = "#9D1457"
    var subBgColor = "#630131"
    
    struct Messages {
        var messages: [String]!
        var dates: [String]!
        var date: String!
    }
    
    var messagesArray = [Messages]()
    
    
    
    var screenHeight: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.mainScreen().bounds.size.height
        } else {
            return UIScreen.mainScreen().bounds.size.width
        }
    }
    
    var screenOrientation: UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
    
    var events:[(name: String, address: String)] = [
        ("25-08-2016, 10:30:15 am", "Rangoli competition & kite festival on 17-1-2016"),
        ("25-08-2016, 10:30:15 am", "Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner "),
        ("25-08-2016, 10:30:15 am", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner. War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner. War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner. War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner."),
        ("25-08-2016, 10:30:15 am", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed. Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed"),
        ("25-08-2016, 10:30:15 am", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner."),
        ("25-08-2016, 10:30:15 am", "Rangoli competition & kite festival on 17-1-2016"),
        ("25-08-2016, 10:30:15 am", "Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner "),
        ("25-08-2016, 10:30:15 am", "War memorial hall, Mount eden on 1-6-2016 Friday 6.00pm, all are welcome and followed by dinner."),
        ("25-08-2016, 10:30:15 am", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed"),
        ("25-08-2016, 10:30:15 am", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner. War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner. War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner. War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner.")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Messages"
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.backgroundColor = hexStringToUIColor(mainViewcolor)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        messagesArray = [
            Messages(messages: ["Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed", "angoli competition & kite festival on 17-1-2016"], dates: ["2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am"], date: "Today"),
            Messages(messages: ["Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed", "angoli competition & kite festival on 17-1-2016"], dates: ["2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am"], date: "Yesterday"),
            Messages(messages: ["Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner", "Diwali stall opens at 2 Pm at queens street. ", "angoli competition & kite festival on 17-1-2016"], dates: ["2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am"], date: "One week ago"),
            Messages(messages: ["WWar memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner. War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner.", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed", "angoli competition & kite festival on 17-1-2016"], dates: ["2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am", "2016-10-08 10:05:15 am"], date: "Few weeks ago")
        ]
        
        self.tableView.sectionHeaderHeight = 40
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
        //return 1
        
        return messagesArray.count
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return events.count
        
        return messagesArray[section].messages.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MessagesViewCell
        
        // Configure the cell...
        //let event = events[indexPath.row]
        //cell.nameLabel.text = event.name
        cell.nameLabel.text = messagesArray[indexPath.section].dates[indexPath.row]
        cell.addressLabel.text = messagesArray[indexPath.section].messages[indexPath.row]
        cell.mainBg.backgroundColor = hexStringToUIColor("#fce7de")
        
        
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return messagesArray[section].date
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let title: UILabel = UILabel()
        
        title.text = messagesArray[section].date
        title.textColor = hexStringToUIColor("#ff0000")
        //title.backgroundColor = UIColor(red: 225.0/255.0, green: 243.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        title.backgroundColor = hexStringToUIColor("#ffffff")
        title.font = UIFont.boldSystemFontOfSize(20)
        
        let constraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[label]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["label": title])
        
        title.addConstraints(constraint)
        
        title.textAlignment = NSTextAlignment.Center
        
        return title
    }
    
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
