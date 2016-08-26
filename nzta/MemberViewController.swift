//
//  MemberViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 15/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class MemberViewController: UITableViewController{
    let prefs = NSUserDefaults.standardUserDefaults()
    
    var titles = ["Upcoming Events", "Existing Events", "Go Green/NZ Blood", "Invite a Friend", "Helping", "All"]
    var titlesBig = ["2016", "2015", "Others", "Friend", "Hands!", "Messages"]
    var images = ["upcoming_events.png", "existing_events.png", "go_green.png", "invite_friend.png", "hands.png", "hands.png"]
    var bgColors = ["#ff218e", "#ffd428", "#10d295", "#039cfd", "#b21b0f", "#FD5F22"]
    
    var screenWidth: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.mainScreen().bounds.size.width
        } else {
            return UIScreen.mainScreen().bounds.size.height
        }
    }
    
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
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NZTA"
        //self.navigationController?.navigationBarHidden = false
        
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
        return 6
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*let border = CALayer()
         let width = CGFloat(2.0)
         border.borderColor = UIColor.darkGrayColor().CGColor
         border.frame = CGRect(x: 0, y: tableView.frame.size.height - width, width:  tableView.frame.size.width, height: tableView.frame.size.height)
         
         border.borderWidth = width
         tableView.layer.addSublayer(border)
         tableView.layer.masksToBounds = true*/
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MemberViewCell
        // Configure the cell...
        cell.backgroundColor = hexStringToUIColor(bgColors[indexPath.row])
        cell.titleLabel?.text = titles[indexPath.row]
        cell.titleBigLabel?.text = titlesBig[indexPath.row]
        cell.iconImageView?.image = UIImage(named: images[indexPath.row])
        return cell
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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let height = (screenHeight / 4) - 15
        //return 400.0;//Choose your custom row height
        return height
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row) {
            //case 0: [self performSegueWithIdentifier:@"Segue0" sender:self];
            case 0:
                self.prefs.setValue("Upcoming Events", forKey: "eventType")
                self.performSegueWithIdentifier("events", sender: self)
                break;
            case 1:
                self.performSegueWithIdentifier("existingEvents", sender: self)
                break;
            case 2:
                self.prefs.setValue("Go Green", forKey: "eventType")
                self.performSegueWithIdentifier("events", sender: self)
                break
            case 3:
                self.performSegueWithIdentifier("inviteFriend", sender: self)
                break
            case 4:
                self.performSegueWithIdentifier("events", sender: self)
                break
            case 5:
                self.performSegueWithIdentifier("messages", sender: self)
                break
            default:
                break
        }
    }
    
   
    /*override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let pageViewController =
            storyboard?.instantiateViewControllerWithIdentifier("WalkthroughController")
                as? WalkthroughPageViewController {
                    presentViewController(pageViewController, animated: true, completion:nil)
        }
    }*/

    

    
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
