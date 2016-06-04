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
    
    var images : NSMutableArray = NSMutableArray()
    var selectedIndex : Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numbers = [1,2,3,4,5,6]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numbers = [1,2,3,4,5,6]
        images = NSMutableArray(array: ["team1.jpg","team2.jpg","team3.jpg","team4.jpg","team5.jpg","team6.jpg","team7.jpg","team8.jpg","team9.jpg","team10.jpg","team11.jpg","team12.jpg","team13.jpg"])
        
        //carouselView.vertical = true
        
        carouselView.type = .Rotary
        
        carouselView .reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return images.count
    }
    
    /*func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
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
    }*/
    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView
    {
        var itemView: UIImageView
        if (view == nil)
        {
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:250, height:250))
            //itemView.contentMode = .ScaleAspectFit
            itemView.contentMode = .ScaleAspectFill
        }
        else
        {
            itemView = view as! UIImageView;
        }
        itemView.image = UIImage(named: "\(images.objectAtIndex(index))")
        return itemView
    }
    
    func carousel(carousel: iCarousel, didSelectItemAtIndex index: Int) {
        selectedIndex = index
        self .performSegueWithIdentifier("imageDisplaySegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "imageDisplaySegue")
        {
            let viewController : ImageDisplayViewController = segue.destinationViewController as! ImageDisplayViewController
            viewController.selectedImage = UIImage(named: "\(images.objectAtIndex(selectedIndex))")
        }
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
