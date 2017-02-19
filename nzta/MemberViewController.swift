//
//  MemberViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 15/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class MemberViewController: UITableViewController{
    let prefs = UserDefaults.standard
    
    var titles = ["Upcoming Events", "Existing Events", "Helping", "Invite a Friend/", "All"]
    var titlesBig = ["2016", "2015", "Hands!",  "Family", "Messages"]
    //var images = ["upcoming_events.png", "existing_events.png", "hands.png", "invite_friend.png",  "all_messaes.png"]
    var images = ["upcoming_events2.png", "existing_events2.png", "hands2.png", "invite_friend2.png",  "all_messages2.png"]
    var bgColors = ["#ff218e", "#ffd428", "#10d295", "#039cfd", "#fc5f22"]
    
    var messages:[(date: String, time: [String], message: [String], from: [String])] = []
    
    var screenWidth: CGFloat {
        if UIInterfaceOrientationIsPortrait(screenOrientation) {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
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
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NZTA"
        //self.navigationController?.navigationBarHidden = false
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if ((prefs.string(forKey: "signUp")) != nil){
            let alertController = UIAlertController(title: "NZTA",
                message: "Welcome!! Thank you for registering with NZTA, will keep you updated with latest info.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style:
                UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion:
                nil)
            self.prefs.setValue(nil, forKey: "signUp")
        }
        
       /* let requestURL: NSURL = NSURL(string: "http://sdctbheemili.org/ios/messages.php?type=messages")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    var getMessages:[String] = []
                    var getDates: [String] = []
                    var getDates2: [String] = []
                    
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
                            
                        }
                        
                        
                        
                        NSUserDefaults.standardUserDefaults().setObject(getMessages, forKey: "getMessages")
                        
                        NSUserDefaults.standardUserDefaults().synchronize()
                        
                        NSUserDefaults.standardUserDefaults().setObject(getDates, forKey: "getDates")
                        
                        NSUserDefaults.standardUserDefaults().synchronize()
                        
                        NSUserDefaults.standardUserDefaults().setObject(getDates2, forKey: "getDates2")
                        
                        NSUserDefaults.standardUserDefaults().synchronize()
                        
                    }
                    
                    //print("\(getMessages)")
                }catch {
                    print("Error with Json: \(error)")
                }
                
                
                
            }
        }
        
        task.resume()*/
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    
        //let requestURL: NSURL = NSURL(string: "http://sdctbheemili.org/ios/messages.php?type=messages")!
        let time = Int64(Date().timeIntervalSince1970 * 1000)
        let requestURL: URL = URL(string: "http://tokkalo.com/api/1/messages.php?time=" + String(time))!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: requestURL)
        //let session = URLSession.shared
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            if (statusCode == 200) {
                //print("Everyone is fine, file downloaded successfully.")
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String:AnyObject]
                    //print(json)
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
                        
                        
                        
                        UserDefaults.standard.set(getMessages, forKey: "getMessages")
                        
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(getDates, forKey: "getDates")
                        
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(getDates2, forKey: "getDates2")
                        
                        UserDefaults.standard.synchronize()
                        

                        UserDefaults.standard.set(json, forKey: "getJson")
                        
                        UserDefaults.standard.synchronize()
                        
                        
                    }
                    
                    //print(NSUserDefaults.standardUserDefaults().objectForKey("getJson")!)
                }catch {
                    print("Error with Json: \(error)")
                }
                
                
                
            }
        }
        
        task.resume()

        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let border = CALayer()
         let width = CGFloat(2.0)
         border.borderColor = UIColor.darkGrayColor().CGColor
         border.frame = CGRect(x: 0, y: tableView.frame.size.height - width, width:  tableView.frame.size.width, height: tableView.frame.size.height)
         
         border.borderWidth = width
         tableView.layer.addSublayer(border)
         tableView.layer.masksToBounds = true*/
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MemberViewCell
        // Configure the cell...
        cell.backgroundColor = hexStringToUIColor(bgColors[indexPath.row])
        cell.titleLabel?.text = titles[indexPath.row]
        cell.titleBigLabel?.text = titlesBig[indexPath.row]
        cell.iconImageView?.image = UIImage(named: images[indexPath.row])
        
        cell.selectionStyle = .none
        
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
        
        return cell
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = (screenHeight / 4) - 15
        //return 400.0;//Choose your custom row height
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
            //case 0: [self performSegueWithIdentifier:@"Segue0" sender:self];
            case 0:
                self.prefs.setValue("Upcoming Events", forKey: "eventType")
                self.performSegue(withIdentifier: "events", sender: self)
                break;
            case 1:
                self.prefs.setValue("Existing Events", forKey: "eventType")
                self.performSegue(withIdentifier: "existingEvents", sender: self)
                break;
            case 2:
                self.prefs.setValue("Helping Hands", forKey: "menuType")
                self.prefs.setValue("Helping Hands", forKey: "eventName")
                self.performSegue(withIdentifier: "helpingHands", sender: self)
                break
            case 3:
                self.performSegue(withIdentifier: "inviteFriend", sender: self)
                break
            case 4:
                self.performSegue(withIdentifier: "messages", sender: self)
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
