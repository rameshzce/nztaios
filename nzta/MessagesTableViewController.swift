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
    
    var rams: [String] = []
    var rams2: [String] = []
    
    struct Messages {
        var messages: [String]!
        var dates: [String]!
        var date: String!
    }
    
    struct Message {
        var m: [String]
        var t: [String]
        var f: [String]
    }
    
    var allMessages = [String: Message]()
    
    let messages = [] as NSArray
    
    let json = UserDefaults.standard.object(forKey: "getJson")! as! [String:AnyObject]
    
    var messagesArray = [Messages]()
    
    
    
    var screenHeight: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }
    }
    
    var screenOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }
    
    var msgs:[(day: String, message: [String], from: [String], time: [String])] = []
    
    var mesgs: [String] = []
    var times: [String] = []
    var from : [String] = []
    var dates: [String] = []
    
    var ramMsg = [String: [String]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Messages"
        /*self.msgs = [(
            "today",
            ["Welcome to New Zealand Telugu Associaion", "message 3", "message 4", "message 4", "message 5"],
            ["rams", "kolamala", "rams", "ko", "ios"],
            ["10.00 am", "11.15 am", "01.20 pm", "03.34 pm", "05.50 pm"]),
                     (
                        "yesterday",
                        ["message 1", "message 2", "message 3", "message 4", "message 5", "message 6"],
                        ["rams", "kolamala", "rams", "ko", "ios", "ios"],
                        ["10.00 am", "11.15 am", "01.20 pm", "03.34 pm", "05.50 pm", "05.50 pm"]),
                     (
                        "one week ago",
                        ["message 1", "message 2", "message 3"],
                        ["message 5", "message 6", "message 7"],
                        ["10.00 am", "11.15 am", "01.20 pm"]
            )]*/
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.backgroundColor = hexStringToUIColor(mainViewcolor)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
        self.tableView.sectionHeaderHeight = 40
        
        
        if let messages = json["messages"] as? [[String: AnyObject]] {
            for message in messages {
             
                let date = message["date"] as? String
                let msg = message["message"] as? String
                let time = message["time"] as? String
                let frm = message["from"] as? String
                
                if self.dates.contains(date!) {
                    
                    let index = self.dates.index(of: date!)
                    
                    msgs[index!].message.append(msg!)
                    msgs[index!].from.append(frm!)
                    msgs[index!].time.append(time!)
                }else{
                    self.dates.append(date!)
                    self.mesgs.append(msg!)
                    self.from.append(frm!)
                    self.times.append(time!)
                    self.msgs.append((day: date!, message: mesgs, from: from, time: times) )
                }

                
                mesgs = []
                times = []
                from = []
                
                
            }
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return msgs.count
        
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return msgs[section].message.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessagesViewCell
        
        // Configure the cell...

        cell.nameLabel.text = msgs[indexPath.section].time[indexPath.row]
        cell.addressLabel.text = msgs[indexPath.section].message[indexPath.row]
        cell.name.text = msgs[indexPath.section].from[indexPath.row]
        cell.mainBg.backgroundColor = hexStringToUIColor("#fce7de")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return msgs[section].day
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let title: UILabel = UILabel()
        
        title.text = msgs[section].day
        title.textColor = hexStringToUIColor("#ff0000")
        //title.backgroundColor = UIColor(red: 225.0/255.0, green: 243.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        title.backgroundColor = hexStringToUIColor("#ffffff")
        title.font = UIFont.boldSystemFont(ofSize: 20)
        
        let constraint = NSLayoutConstraint.constraints(withVisualFormat: "H:[label]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["label": title])
        
        title.addConstraints(constraint)
        
        title.textAlignment = NSTextAlignment.center
        
        return title
    }
    
    func hexStringToUIColor (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    

}
