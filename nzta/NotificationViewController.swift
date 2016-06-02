//
//  NotificationViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 03/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet var message: UILabel!
    var alertMessage: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.message.text = alertMessage
        
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
