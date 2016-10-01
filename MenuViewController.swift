//
//  MenuViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 24/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    var menuItems = ["Home", "Profile", "Subscribe", "Team NZTA", "Sponsors", "Send a message"]
    var currentItem = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return menuItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuViewCell
        
        // Configure the cell...
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = UIColor.whiteColor()
        
        return cell
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.sourceViewController as! MenuViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
            currentItem = menuItems[selectedIndexPath.row]
        }
    }*/
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row) {
        //case 0: [self performSegueWithIdentifier:@"Segue0" sender:self];
        case 0:
            self.performSegueWithIdentifier("menuNzta", sender: self)
            break;
        case 1:
            self.performSegueWithIdentifier("menuProfile", sender: self)
            break;
        case 2:
            self.performSegueWithIdentifier("menuSubscription", sender: self)
            break
        case 3:
            self.performSegueWithIdentifier("menuNZTeam", sender: self)
            break
        case 4:
            self.performSegueWithIdentifier("menuSponsors", sender: self)
            break
        case 5:
            self.performSegueWithIdentifier("menuSendMessage", sender: self)
            break
        default:
            break
        }
        
     
    }
    
}
