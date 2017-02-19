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
    //var menuItems = ["Home", "Profile", "Subscribe", "Team NZTA", "Sponsors"]
    var menuIcons = ["menu_icon_home", "menu_icon_profile", "menu_icon_subscribe", "menu_icon_team", "menu_icon_sponsors", "menu_icon_send_message"]
    var currentItem = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuViewCell
        
        // Configure the cell...
        
        //let menuBgColor = "#ba1768"
        
        //cell.menuBg.backgroundColor = Helper.hexStringToUIColor(menuBgColor)
        
        cell.titleLabel.text = menuItems[indexPath.row]
        //cell.titleLabel.textColor = UIColor.whiteColor()
        cell.menuIcon.image = UIImage(named: menuIcons[indexPath.row])
        
        return cell
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuTableViewController = segue.sourceViewController as! MenuViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
            currentItem = menuItems[selectedIndexPath.row]
        }
    }*/
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rowColor = "#ff218e"
        
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        selectedCell.contentView.backgroundColor = Helper.hexStringToUIColor(rowColor)
        
        switch (indexPath.row) {
        //case 0: [self performSegueWithIdentifier:@"Segue0" sender:self];
        case 0:
            self.performSegue(withIdentifier: "menuNzta", sender: self)
            break;
        case 1:
            self.performSegue(withIdentifier: "menuProfile", sender: self)
            break;
        case 2:
            self.performSegue(withIdentifier: "menuSubscription", sender: self)
            break
        case 3:
            self.performSegue(withIdentifier: "menuNZTeam", sender: self)
            break
        case 4:
            self.performSegue(withIdentifier: "menuSponsors", sender: self)
            break
        case 5:
            self.performSegue(withIdentifier: "menuSendMessage", sender: self)
            break
        default:
            break
        }
        
     
    }
    
}
