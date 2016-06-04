//
//  ViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 15/04/16.
//  Copyright © 2016 Tokkalo.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GIDSignInUIDelegate, FBSDKLoginButtonDelegate
{
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mob: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet var msg: UILabel!
    
    @IBOutlet var btnFacebook: FBSDKLoginButton!
    @IBOutlet var ivUserProfileImage: UIImageView!
    @IBOutlet var lblName: UILabel!
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    func configureFacebook()
    {
        btnFacebook.readPermissions = ["public_profile", "email", "user_friends"];
        btnFacebook.delegate = self
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
            
            let strFirstName: String = (result.objectForKey("first_name") as? String)!
            let strLastName: String = (result.objectForKey("last_name") as? String)!
            let strPictureURL: String = (result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as? String)!
            
            self.lblName.text = "Welcome, \(strFirstName) \(strLastName)"
            self.ivUserProfileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: strPictureURL)!)!)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        ivUserProfileImage.image = nil
        lblName.text = ""
    }
    
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
            let postString = "fname=\(name.text!)&mobile=\(mob.text!)&organization=\(email.text!)&login_type=1&device_id=\(prefs.stringForKey("tokenString")!)"
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
    
    @IBAction func btnSignoutTapped(sender: AnyObject)
    {
        GIDSignIn.sharedInstance().signOut()
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
        self.navigationController?.navigationBarHidden = false
        configureFacebook()
        //GIDSignIn.sharedInstance().uiDelegate = self
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...

         
         //if let login = prefs.stringForKey("login"){
         if prefs.stringForKey("login") != nil{
         //self.showAlert("You have already logged in as: \(login)")
            //self.performSegueWithIdentifier("member", sender: self)
         }else{
            //self.showAlert("Not logged in")
         }
    }
    
    override func viewDidAppear(animated: Bool) {
        if prefs.stringForKey("login") != nil{
            self.performSegueWithIdentifier("member", sender: self)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        //myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    /*override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }*/
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
}


