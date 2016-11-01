//
//  SendMessageViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 28/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var messageText: UITextView!
    @IBOutlet var btnSendInvite: UIButton!
    //@IBOutlet var textMoble: UITextField!
    @IBOutlet var labelMsg: UILabel!
    
    let numberToolbar: UIToolbar = UIToolbar()
    
    @IBAction func sendInvite(sender: UIButton) {
        if ( (messageText.text == "") || ((messageText.text == "Message here")) ){
            showAlert("Please enter a message")
        }  else {
            //SwiftLoading().showLoading()
            //self.labelMsg.text = "Sending..."
            let request = NSMutableURLRequest(URL: NSURL(string: "http://sdctbheemili.org/ios/push-notification.php")!)
            request.HTTPMethod = "POST"
            let postString = "msg=\(messageText.text!)"
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
                    self.prefs.setValue(message, forKey: "notificationMsg")
                    //self.labelMsg.text = ""
                    //SwiftLoading().hideLoading()
                    //self.showAlert("\(message)")
                    
                    
                } catch {
                    // Handle Error
                }
                
                dispatch_async(dispatch_get_main_queue(),{
                    if (self.prefs.stringForKey("notificationMsg") != nil){
                        //self.labelMsg.text = ""
                        self.showAlert("\(self.prefs.stringForKey("notificationMsg")!)")
                        self.messageText.text = "Message here"
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
        
        //textMoble.frame.size.height = 53;
        
        //Helper.customizetextField3(textMoble)
        //messageText.attributedPlaceholder = NSAttributedString(string:"Message", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        
        // Do any additional setup after loading the view.
        
        numberToolbar.barStyle = UIBarStyle.BlackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InviteFriendViewController.cancel)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InviteFriendViewController.done))
        ]
        
        numberToolbar.sizeToFit()
        
        messageText.inputAccessoryView = numberToolbar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func done () {
        messageText.resignFirstResponder()
    }
    
    func cancel () {
        messageText.text="Message here"
        messageText.resignFirstResponder()
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
    
    func textViewDidBeginEditing(textView: UITextView) {
        if (messageText.text == "Message here") {
            messageText.text = ""
        }
        
        scrollView.setContentOffset(CGPointMake(0, 50), animated: true)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        scrollView.setContentOffset(CGPointMake(0, -50), animated: true)
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
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
