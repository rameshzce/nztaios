//
//  ImageDisplayViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 04/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class ImageDisplayViewController: UIViewController {

    var selectedImage : UIImage!
    @IBOutlet weak var ivDisplayImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ivDisplayImage.image = selectedImage
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
    }

}
