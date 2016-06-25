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
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mobileLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var imgDnArrow: UIImageView!
    
    var index = 0
    var position = ""
    var name = ""
    var mobile = ""
    var email = ""
    var imageFile = ""
    var bgColor = ""
    var lastImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        positionLabel.text = position
        positionLabel.textColor = Helper.hexStringToUIColor(bgColor)
        nameLabel.text = name
        mobileLabel.text = mobile
        emailLabel.text = email
        topBg.backgroundColor = Helper.hexStringToUIColor("#ffffff")
        bottomBg.backgroundColor = Helper.hexStringToUIColor(bgColor)
        contentImageView.image = UIImage(named: imageFile)
        
        if(lastImage == "yes"){
            imgDnArrow.hidden = true
        }
        

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
