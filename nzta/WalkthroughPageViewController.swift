//
//  WalkthroughPageViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 18/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageHeadings = ["Mr. Dharmendar Alle", "Mr. Venkata Ramana Rao salvaji", "Mr.Arun Rao Paidigummala", "Mrs.Rajeshwari Gangishetty", "Mr.Raja Shekar Reddy Patlolla", "Mr. Narsing Rao Enaganti", "Mr. Srinivas Yepuri", "Mr.Sai Santhan Reddy Kusam"]
    
    var positions = ["President", "General Secretary", "Vice President", "Vice President", "Treasurer", "Joint Secretary", "Joint Secretary", "Joint Treasurer"]
    
    var mobiles = ["0212663666", "0220491003", "0212511454", "02102604222", "02102468855", "xxx", "xxx", "02102399325"]
    
    var emails = ["nztapresident@gmail.com", "generalsecretarynzta@gmail.com", "arunrao.p@gmail.com", "rajjugangishetty@gmail.com", "rrpatllola@gmail.com", "xxx", "xxx", "xxx"]
    
    var pageImages = ["team1", "team2", "team3", "team4", "team5", "team6", "team7", "team8"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source to itself
        dataSource = self
        // Create the first walkthrough screen
        if let startingViewController = viewControllerAtIndex(0) {
            setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
        }
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) ->
        UIViewController? {
            var index = (viewController as! WalkthroughContentViewController).index
            
            index += 1
            
            return viewControllerAtIndex(index)
    }
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) ->
        UIViewController? {
            var index = (viewController as! WalkthroughContentViewController).index
            index -= 1
            return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> WalkthroughContentViewController? {
        if index == NSNotFound || index < 0 || index >= pageHeadings.count {
            return nil
        }
        // Create a new view controller and pass suitable data.
        if let pageContentViewController =
            storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContentViewController")
                as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.position = positions[index]
            //pageContentViewController.desig = pageHeadings[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
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
