//
//  InviteFriendViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 28/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class InviteFriendViewController: UIViewController, UITextFieldDelegate {

    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var btnSendInvite: UIButton!
    @IBOutlet var textMoble: UITextField!
    @IBOutlet var labelMsg: UILabel!
    @IBAction func sendInvite(sender: UIButton) {
        if (textMoble.text == "") {
            showAlert("Please enter mobile")
        }  else {
            //SwiftLoading().showLoading()
            //self.labelMsg.text = "Sending..."
            let request = NSMutableURLRequest(URL: NSURL(string: "http://tokkalo.com/api/1/invite_friend.php")!)
            request.HTTPMethod = "POST"
            let postString = "toMobile=\(textMoble.text!)&fromMobile=\(prefs.stringForKey("login")!)"
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                
                data, response, error in
                
                
                if error != nil {
                    self.showAlert("Error: \(error)")
                    return
                }
                
                do {
                    
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let message = jsonDictionary["message"] as! String
                    self.prefs.setValue(message, forKey: "inviteMsg")
                    //self.labelMsg.text = "\(message)"
                    SwiftLoading().hideLoading()
                    //self.showAlert("\(message)")
                    
                    
                } catch {
                    // Handle Error
                }
                
                dispatch_async(dispatch_get_main_queue(),{
                    if (self.prefs.stringForKey("inviteMsg") != nil){
                        self.showAlert("\(self.prefs.stringForKey("inviteMsg")!) Have a good day! ")
                    }
                });
            }
            task.resume()
            
            
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btnSendInvite.layer.cornerRadius = 5
        Helper.customizeButton(btnSendInvite)
        
        //Helper.customizetextField(textMoble)
        textMoble.attributedPlaceholder = NSAttributedString(string:"Mobile", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        //ScrollView.setContentOffset(CGPointMake(0, 150), animated: true)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //ScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func showAlert(msg: String){
        let alertController = UIAlertController(title: "NZTA",
                                                message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style:
            UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion:
            nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
