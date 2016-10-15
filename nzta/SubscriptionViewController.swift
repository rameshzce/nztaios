//
//  SubscriptionViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 24/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class SubscriptionViewController: UIViewController, SSRadioButtonControllerDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var button1: SSRadioButton!
    @IBOutlet var button2: SSRadioButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var mobileTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var btnSubscribe: UIButton!
    var radioButtonController: SSRadioButtonsController?
    
    let numberToolbar: UIToolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioButtonController = SSRadioButtonsController(buttons: button1, button2, button3)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        
        
        Helper.customizeButton(btnSubscribe)
        
        Helper.customizetextField3(emailTextField)
        Helper.customizetextField3(nameTextField)
        Helper.customizetextField3(mobileTextField)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string:"Email", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        nameTextField.attributedPlaceholder = NSAttributedString(string:"Name", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        mobileTextField.attributedPlaceholder = NSAttributedString(string:"Mob", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        numberToolbar.barStyle = UIBarStyle.BlackTranslucent
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InviteFriendViewController.cancel)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(InviteFriendViewController.done))
        ]
        
        numberToolbar.sizeToFit()
        
        mobileTextField.inputAccessoryView = numberToolbar

        // Do any additional setup after loading the view.
    }
    
    func didSelectButton(aButton: UIButton?) {
        //print(aButton.)
    }
    
    func done () {
        mobileTextField.resignFirstResponder()
    }
    
    func cancel () {
        mobileTextField.text=""
        mobileTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        //scrollView.setContentOffset(CGPointMake(0, 10), animated: true)
        if (textField == nameTextField){
            scrollView.setContentOffset(CGPointMake(0, 10), animated: true)
        } else if (textField == emailTextField){
            scrollView.setContentOffset(CGPointMake(0, 20), animated: true)
        } else if (textField == mobileTextField){
            scrollView.setContentOffset(CGPointMake(0, 30), animated: true)
        }
        
        textField.placeholder = nil
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //scrollView.setContentOffset(CGPointMake(0, -50), animated: true)
        if (textField == nameTextField){
            nameTextField.placeholder = "Name"
        }else if (textField == mobileTextField){
            mobileTextField.placeholder = "Mob"
        }else if (textField == emailTextField){
            emailTextField.placeholder = "Email"
        }
        
        scrollView.setContentOffset(CGPointMake(0, -50), animated: true)
        textField.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if (textField == nameTextField){
            nameTextField.placeholder = "Name"
        }else if (textField == mobileTextField){
            mobileTextField.placeholder = "Mob"
        }else if (textField == emailTextField){
            emailTextField.placeholder = "Email"
        }
        
        textField.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        return true
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
