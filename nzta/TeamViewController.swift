//
//  TeamViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 03/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {
    @IBOutlet var carouselView: iCarousel!
    var numbers = [Int]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numbers = [1,2,3,4,5,6]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numbers = [1,2,3,4,5,6]
        carouselView.type = .Cylinder
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return numbers.count
    }
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        button.setTitle("\(index)", forState: .Normal)
        button.backgroundColor = UIColor.redColor()
        
        tempView.addSubview(button)
        
        return tempView
    }
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.Spacing{
            return value * 1.1
        }
        
        return value
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
