//
//  WalkthroughContentViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 18/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    @IBOutlet var positionLabel:UILabel!
    @IBOutlet var contentImageView:UIImageView!
    @IBOutlet var designation: UILabel!
    @IBOutlet var topBg: UIView!
    @IBOutlet var bottomBg: UIView!
    
    var index = 0
    var position = ""
    var desig = ""
    var imageFile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        positionLabel.text = position
        //designation.text = desig
        contentImageView.image = UIImage(named: imageFile)

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
