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
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.whiteColor().CGColor
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 10, textField.frame.height))
        
        textField.leftView = paddingView
        
        textField.leftViewMode = UITextFieldViewMode.Always
    }
    
    static func customizeButton(button: UIButton!) {
        button.setBackgroundImage(nil, forState: .Normal)
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.titleLabel!.font =  UIFont(name: "handlee-regular", size: 18)
        button.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Normal)
    }
}
