//
//  SendMessageViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 28/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class SendMessageViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    let prefs = UserDefaults.standard
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var messageText: UITextView!
    @IBOutlet var btnSendInvite: UIButton!
    //@IBOutlet var textMoble: UITextField!
    @IBOutlet var labelMsg: UILabel!
    
    let numberToolbar: UIToolbar = UIToolbar()
    
    @IBAction func sendInvite(_ sender: UIButton) {
        if ( (messageText.text == "") || ((messageText.text == "Message here")) ){
            showAlert("Please enter a message")
        }  else {
            //SwiftLoading().showLoading()
            //self.labelMsg.text = "Sending..."
            let request = NSMutableURLRequest(url: URL(string: "http://sdctbheemili.org/ios/push-notification.php")!)
            request.httpMethod = "POST"
            let postString = "msg=\(messageText.text!)&profile_name=\(prefs.string(forKey: "profileName")!)"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest)  {
                
                data, response, error in
                
                
                if error != nil {
                    self.showAlert("Error: \(error)")
                    return
                }
                
                do {
                    
                    let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    let message = jsonDictionary["message"] as! String
                    self.prefs.setValue(message, forKey: "notificationMsg")
                    //self.labelMsg.text = ""
                    //SwiftLoading().hideLoading()
                    //self.showAlert("\(message)")
                    
                    
                } catch {
                    // Handle Error
                }
                
                DispatchQueue.main.async(execute: {
                    if (self.prefs.string(forKey: "notificationMsg") != nil){
                        //self.labelMsg.text = ""
                        self.showAlert("\(self.prefs.string(forKey: "notificationMsg")!)")
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
        
        numberToolbar.barStyle = UIBarStyle.blackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(InviteFriendViewController.cancel)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(InviteFriendViewController.done))
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //ScrollView.setContentOffset(CGPointMake(0, 150), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //ScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (messageText.text == "Message here") {
            messageText.text = ""
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        scrollView.setContentOffset(CGPoint(x: 0, y: -50), animated: true)
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    
    func showAlert(_ msg: String){
        let alertController = UIAlertController(title: "NZTA",
                                                message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style:
            UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion:
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
