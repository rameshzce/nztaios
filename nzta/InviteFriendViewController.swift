//
//  InviteFriendViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 28/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class InviteFriendViewController: UIViewController, UITextFieldDelegate {

    let prefs = UserDefaults.standard
    let numberToolbar: UIToolbar = UIToolbar()
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var btnSendInvite: UIButton!
    @IBOutlet var textMoble: UITextField!
    @IBOutlet var labelMsg: UILabel!
    @IBAction func sendInvite(_ sender: UIButton) {
        if (textMoble.text == "") {
            showAlert("Please enter mobile")
        }  else {
            //SwiftLoading().showLoading()
            //self.labelMsg.text = "Sending..."
            let request = NSMutableURLRequest(url: URL(string: "http://tokkalo.com/api/1/invite_friend.php")!)
            request.httpMethod = "POST"
            let postString = "toMobile=\(textMoble.text!)&fromMobile=\(prefs.string(forKey: "login")!)"
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
                    self.prefs.setValue(message, forKey: "inviteMsg")
                    //self.labelMsg.text = "\(message)"
                    SwiftLoading().hideLoading()
                    //self.showAlert("\(message)")
                    
                    
                } catch {
                    // Handle Error
                }
                
                DispatchQueue.main.async(execute: {
                    if (self.prefs.string(forKey: "inviteMsg") != nil){
                        self.showAlert("\(self.prefs.string(forKey: "inviteMsg")!) ")
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
        textMoble.attributedPlaceholder = NSAttributedString(string:"Mobile here", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        numberToolbar.barStyle = UIBarStyle.blackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(InviteFriendViewController.cancel)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(InviteFriendViewController.done))
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        textMoble.placeholder = nil
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        textMoble.placeholder = "Mobile here"
        textMoble.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textMoble.placeholder = "Mobile here"
        textMoble.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
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
