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
    
    var selectedYear: String = ""
    
    var Array = ["2012", "2013", "2014", "2015"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.delegate = self
        datePicker.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array[row]
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
        let alertController = UIAlertController(title: "NZTA",
                                                message: "\(selectedYear)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style:
            UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion:
            nil)
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
