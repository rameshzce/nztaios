//
//  InviteFriendViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 28/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class InviteFriendViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var TextField: UITextField!
    @IBOutlet var TextField2: UITextField!
    @IBOutlet var TextField3: UITextField!
    
    @IBOutlet var TextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
    
    func textViewDidBeginEditing(textView: UITextView) {
        ScrollView.setContentOffset(CGPointMake(0, 50), animated: true)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        ScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    @IBAction func sendInvite(sender: UIButton) {
        if (TextField3.text == "") {
            showAlert("Please enter mobile")
        } else if (TextView.text == "") {
            showAlert("Please enter message")
        } else {
            /*SwiftLoading().showLoading()
            let request = NSMutableURLRequest(URL: NSURL(string: "http://tokkalo.com/api/1/invite_friend.php")!)
            request.HTTPMethod = "POST"
            let postString = "toMobile=\(TextField3.text!)&fromMobile=\(prefs.stringForKey("login")!)"
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                
                data, response, error in
                
                
                if error != nil {
                    self.showAlert("Error: \(error)")
                    return
                }
                
                do {
                    SwiftLoading().hideLoading()
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let message = jsonDictionary["message"] as! String
                    self.showAlert("\(message)")
                    
                    
                } catch {
                    // Handle Error
                }
            }
            task.resume()*/
            
            self.showAlert("Your invitation has been sent.")
        }
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
