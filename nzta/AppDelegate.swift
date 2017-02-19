//
//  AppDelegate.swift
//  nzta
//
//  Created by Ramesh Kolamala on 21/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }

    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        application.registerForRemoteNotifications()
        application.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
        
        GIDSignIn.sharedInstance().clientID = "65039566976-ncemvcdc35q8942q2ocrgc77m16uo9hn.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //return true
    }
    /*func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
 
        
        GIDSignIn.sharedInstance().clientID = "65039566976-ncemvcdc35q8942q2ocrgc77m16uo9hn.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        //return true
    }*/
    
    func applicationWillTerminate(_ application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: NSError!)
    {
        if (error == nil)
        {
            // Perform any operations on signed in user here.
            _ = user.userID // For client-side use only!
            _ = user.authentication.idToken //Safe to send to the server
            _ = user.profile.name
            _ = user.profile.email
            _ = user.profile.imageURL(withDimension: 200)
            
            
            // ...
        }
        else
        {
            print("\(error.localizedDescription)")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!, withError error: NSError!)
    {
        // Perform any operations when the user disconnects from app here.
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
    {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        //print(deviceToken)
        
        let prefs = UserDefaults.standard
        
        let tokenChars = (deviceToken as NSData).bytes.bindMemory(to: CChar.self, capacity: deviceToken.count)
        var tokenString = ""
        
        for i in 0..<deviceToken.count {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        
        //print("tokenString: \(tokenString)")
        
        prefs.setValue(tokenString, forKey: "tokenString")
        prefs.synchronize()
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotificationuserInfo userInfo: [AnyHashable: Any]) {
        print(userInfo)
    }
    
    // Called when a notification is received and the app is in the
    // foreground (or if the app was in the background and the user clicks on the notification).
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // display the userInfo
        if let notification = userInfo["aps"] as? NSDictionary, let alert = notification["alert"] as? String {
            /*let alertCtrl = UIAlertController(title: "Time Entry", message: alert as String, preferredStyle: UIAlertControllerStyle.Alert)
            alertCtrl.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            // Find the presented VC...
            var presentedVC = self.window?.rootViewController
            while (presentedVC!.presentedViewController != nil)  {
                presentedVC = presentedVC!.presentedViewController
            }
            presentedVC!.presentViewController(alertCtrl, animated: true, completion: nil)*/
            
            // call the completion handler
            // -- pass in NoData, since no new data was fetched from the server.
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mvc = storyboard.instantiateViewController(withIdentifier: "notification") as! NotificationViewController
            mvc.alertMessage = alert
            let navController = UINavigationController(rootViewController: mvc) // Creating a navigation controller for mvc
            
            var topRootViewController : UIViewController! = self.window?.rootViewController
            while let vvc = topRootViewController.presentedViewController{
                topRootViewController = vvc
                
            }
            topRootViewController.present(navController, animated: true, completion: nil)
            completionHandler(UIBackgroundFetchResult.noData)
        }
    }
    

    
    /*google signin
    
    func application(application: UIApplication, openURL url: NSURL, options: [String: AnyObject]) -> Bool
    {
        return GIDSignIn.sharedInstance().handleURL(url, sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as! String, annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
    }*/
    

}
