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
    
    let messages = NSUserDefaults.standardUserDefaults().objectForKey("allMessages") as! NSArray
    
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
    
    var msgs:[(day: String, message: [String], from: [String], time: [String])] = [
        (
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
        )
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Messages"
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.backgroundColor = hexStringToUIColor(mainViewcolor)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        self.tableView.sectionHeaderHeight = 40
        
        for message in messages {

            
            
            var msgs: [String] = []
            var times: [String] = []
            var from : [String] = []
            var m = Message(m: msgs, t: times, f: from)
            
            
            
            let date = message["date"] as? String
            let msg = message["message"] as? String
            let time = message["time"] as? String
            let frm = message["from"] as? String
            
            if let val = allMessages[date!] {
                msgs = (allMessages[date!]?.m)!
                msgs.append(msg!)
                
                times = (allMessages[date!]?.t)!
                times.append(time!)
                
                from = (allMessages[date!]?.f)!
                from.append(frm!)
                
                m = Message(m: msgs, t: times, f: from)
                allMessages[date!] =  m
                
                /*
                 msgs.append(msg!)
                 times.append(message["time2"] as! String)
                 from.append("rams")*/
                
            }else{
                msgs.append(msg!)
                times.append(time!)
                from.append(frm!)
                m = Message(m: msgs, t: times, f: from)
                allMessages[date!] =  m
            }
            
            
            msgs = []
            times = []
            from = []
            
            
        }
        
        print("didload")
        //print(allMessages)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return msgs.count
        
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return msgs[section].message.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MessagesViewCell
        
        // Configure the cell...

        cell.nameLabel.text = msgs[indexPath.section].time[indexPath.row]
        cell.addressLabel.text = msgs[indexPath.section].message[indexPath.row]
        cell.name.text = msgs[indexPath.section].from[indexPath.row]
        cell.mainBg.backgroundColor = hexStringToUIColor("#fce7de")
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return msgs[section].day
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let title: UILabel = UILabel()
        
        title.text = msgs[section].day
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

    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        //let requestURL: NSURL = NSURL(string: "http://sdctbheemili.org/ios/messages.php?type=messages")!
        let requestURL: NSURL = NSURL(string: "http://tokkalo.com/api/1/messages.php")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                //print("Everyone is fine, file downloaded successfully.")
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    print(data)
                    var getMessages:[String] = []
                    var getDates: [String] = []
                    var getDates2: [String] = []
                    
                    struct Message {
                        var m: [String]
                        var t: [String]
                        var f: [String]
                    }
                    
                    var msgs: [String] = []
                    var times: [String] = []
                    var from : [String] = []
                    var m = Message(m: msgs, t: times, f: from)
                    
                    var allMessages = [String: Message]()
                    
                    if let messages = json["messages"] as? [[String: AnyObject]] {
                        for message in messages {
                            if let messageText = message["message"] as? String {
                                
                                if let messageDate = message["time"] as? String {
                                    if let messageDate2 = message["time2"] as? String {
                                        getMessages.append(messageText)
                                        getDates.append(messageDate)
                                        getDates2.append(messageDate2)
                                    }
                                }
                                
                            }
                            
                            let date = message["date"] as? String
                            let msg = message["message"] as? String
                            let time = message["time"] as? String
                            let frm = message["from"] as? String
                            
                            if let val = allMessages[date!] {
                                msgs = (allMessages[date!]?.m)!
                                msgs.append(msg!)
                                
                                times = (allMessages[date!]?.t)!
                                times.append(time!)
                                
                                from = (allMessages[date!]?.f)!
                                from.append(frm!)
                                
                                m = Message(m: msgs, t: times, f: from)
                                allMessages[date!] =  m
                                
                                /*
                                 msgs.append(msg!)
                                 times.append(message["time2"] as! String)
                                 from.append("rams")*/
                                
                            }else{
                                msgs.append(msg!)
                                times.append(time!)
                                from.append(frm!)
                                m = Message(m: msgs, t: times, f: from)
                                allMessages[date!] =  m
                            }
                            
                            
                            msgs = []
                            times = []
                            from = []
                            
                            
                        }
                        
                        
                        
                        
                        
                        NSUserDefaults.standardUserDefaults().setObject(messages, forKey: "allMessages1")
                        
                        NSUserDefaults.standardUserDefaults().synchronize()
                        
                        
                        
                    }
                    
                    //print(json)
                }catch {
                    print("Error with Json: \(error)")
                }
                
                
                
            }
        }
        
        task.resume()
        print("did appear")
        
    }

}
