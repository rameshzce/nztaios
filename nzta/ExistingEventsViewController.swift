//
//  ExistingEventsViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 29/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class ExistingEventsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var datePicker: UIPickerView!
    
    let prefs = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var btnSelectYear: UIButton!
    var selectedYear: String = ""
    
    var Array = ["2015", "2014", "2013", "2012"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Helper.customizeButton(btnSelectYear)
        
        datePicker.delegate = self
        datePicker.dataSource = self
        
        datePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        //datePicker.setValue("18", forKey: "textSize")

        // Do any additional setup after loading the view.
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.whiteColor()
        pickerLabel.text = Array[row]
        pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 35)
        //pickerLabel.font = UIFont(name: "handlee-regular", size: 35) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        //pickerLabel.font = UIFont(name: "handlee-regular", size: 35)
        return pickerLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 40;
    }
    
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //return row?
        selectedYear = Array[row]
    }
    
    @IBAction func selectYear(sender: UIButton) {
        self.prefs.setValue("Existing Events", forKey: "eventType")
        self.performSegueWithIdentifier("existingEvents", sender: self)
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
