//
//  ProfileViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 24/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    
    @IBAction func doEdit(sender: AnyObject) {
    }
    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var profileName: UILabel!
    @IBOutlet var profileEmail: UILabel!
    @IBOutlet var profileImage: UIImageView!

    @IBOutlet var profileMobile: UILabel!
    @IBOutlet var btnGallery: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btnGallery.layer.cornerRadius = 5
        Helper.customizeButton(btnGallery)
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
        self.profileImage.clipsToBounds = true
        
        self.profileImage.layer.borderWidth = 10.0
        self.profileImage.layer.borderColor = hexStringToUIColor("#C4C4C4").CGColor
        
        /*let path = "/var/mobile/Containers/Data/Application/10C6D07A-29F4-43B0-922F-6E6F1EA2F68E/Documents/image.png"
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)")
        
        self.profileImage.image = image*/
        
        //Helper.loadImageFromUrl("\(prefs.stringForKey("profileImage")!)", view: profileImage)
        
        if prefs.stringForKey("profileImage") != nil{
            //Helper.loadImageFromUrl("http://tokkalo.com/api/1/profile_images/\(self.prefs.stringForKey("profileImage")!)", view: profileImage)
        } else {
            //Helper.loadImageFromUrl("http://tokkalo.com/api/1/profile_images/logo.png", view: profileImage)
        }
        
            self.profileImage.sd_setImageWithURL(NSURL(string: prefs.stringForKey("profileImage")! as String), placeholderImage: UIImage(named: "placeholder"))
            //self.profileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: prefs.stringForKey("profileImage")!)!)!)
            
            self.profileName.text = "\(prefs.stringForKey("profileName")!)"
            self.profileMobile.text = "Mob: \(prefs.stringForKey("profileMobile")!)"
            self.profileEmail.text = "\(prefs.stringForKey("profileEmail")!)"
 
        
        
        self.view.backgroundColor = hexStringToUIColor("#EAEAEA")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
