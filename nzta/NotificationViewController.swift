//
//  NotificationViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 03/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBAction func btnClose(sender: AnyObject) {
        UIControl().sendAction(#selector(NSURLSessionTask.suspend), to: UIApplication.sharedApplication(), forEvent: nil)
    }
    @IBAction func goToHome(sender: AnyObject) {
        //self.performSegueWithIdentifier("goToHome", sender: self)
        UIControl().sendAction(#selector(NSURLSessionTask.suspend), to: UIApplication.sharedApplication(), forEvent: nil)
    }
    @IBOutlet var message: UILabel!
    @IBOutlet var btnOk: UIButton!
    var alertMessage: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.customizeButton(btnOk)
        message.lineBreakMode = .ByWordWrapping
        message.numberOfLines = 0;
        
        self.message.text = "\n\(alertMessage)\n"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
