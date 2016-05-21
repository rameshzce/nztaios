//
//  ViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 15/04/16.
//  Copyright © 2016 Tokkalo.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mob: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet var msg: UILabel!
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBAction func registerUser(sender: UIButton) {
        //performSegueWithIdentifier("member", sender: self)
        if (name.text == "") {
            showAlert("Please enter name")
        } else if (mob.text == "") {
            showAlert("Please enter mob")
        } else if (email.text == "") {
            showAlert("Please enter email")
        } else {
            let request = NSMutableURLRequest(URL: NSURL(string: "http://tokkalo.com/api/1/submit_user.php")!)
            request.HTTPMethod = "POST"
            let postString = "fname=\(name.text!)&mobile=\(mob.text!)&organization=\(email.text!)"
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                data, response, error in
                if error != nil {
                    self.showAlert("Error: \(error)")
                    return
                }
                
                do {
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let status = jsonDictionary["status"] as! String
                    //self.showAlert("\(status)")
                    
                    if status == "SUCCESS"{
                        let phone = jsonDictionary["phone"] as! String
                        //self.showAlert("\(phone)")
                        self.prefs.setValue(phone, forKey: "login")
                        self.performSegueWithIdentifier("member", sender: self)
                    }else if status == "FAILURE"{
                        self.showAlert("\(status)")
                        
                    }
                } catch {
                    // Handle Error
                }
            }
            task.resume()
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        /*self.navigationController?.navigationBarHidden = false
         
         //if let login = prefs.stringForKey("login"){
         if prefs.stringForKey("login") != nil{
         //self.showAlert("You have already logged in as: \(login)")
         self.performSegueWithIdentifier("member", sender: self)
         }else{
         self.showAlert("Not logged in")
         }*/
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
}


