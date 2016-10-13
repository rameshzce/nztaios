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
    let numberToolbar: UIToolbar = UIToolbar()
    
    @IBOutlet var scrollView: UIScrollView!
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
                        self.textMoble.text=""
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
        Helper.customizetextField3(textMoble)
        
        //Helper.customizetextField(textMoble)
        textMoble.attributedPlaceholder = NSAttributedString(string:"Mobile here", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        numberToolbar.barStyle = UIBarStyle.BlackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InviteFriendViewController.cancel)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InviteFriendViewController.done))
        ]
        
        numberToolbar.sizeToFit()
        
        textMoble.inputAccessoryView = numberToolbar

        
        // Do any additional setup after loading the view.
    }
    
    func done () {
        textMoble.resignFirstResponder()
    }
    
    func cancel () {
        textMoble.text=""
        textMoble.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 100), animated: true)
        textMoble.placeholder = nil
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        textMoble.placeholder = "Mobile here"
        textMoble.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textMoble.placeholder = "Mobile here"
        textMoble.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
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
