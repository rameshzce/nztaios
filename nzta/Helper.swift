//
//  Helper.swift
//  nzta
//
//  Created by Ramesh Kolamala on 16/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import Foundation

class Helper{
    static func customizetextField(textField: UITextField!) {
        textField.backgroundColor = UIColor.clearColor()
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.whiteColor().CGColor
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 10, textField.frame.height))
        
        textField.leftView = paddingView
        
        textField.leftViewMode = UITextFieldViewMode.Always
    }
    
    static func customizeButton(button: UIButton!) {
        //button.setBackgroundImage(nil, forState: .Normal)
        //button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0
        //button.layer.borderColor = UIColor.whiteColor().CGColor
        button.titleLabel!.font =  UIFont(name: "handlee-regular", size: 18)
        //button.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Normal)
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
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
    
    static func loadImageFromUrl(url: String, view: UIImageView){
        
        // Create Url from string
        let url = NSURL(string: url)!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    view.image = UIImage(data: data)
                })
            }
        }
        
        // Run task
        task.resume()
    }
}
