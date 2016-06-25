//
//  WalkthroughPageViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 18/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var names = ["Mr. Dharmendar Alle", "Mr. Venkata Ramana Rao salvaji", "Mr.Arun Rao Paidigummala", "Mrs.Rajeshwari Gangishetty", "Mr.Raja Shekar Reddy Patlolla", "Mr. Narsing Rao Enaganti", "Mr. Srinivas Yepuri", "Mr.Sai Santhan Reddy Kusam", "Mr.Aravind Reddy Bathula", "Mrs.Aruna Salvaji", "Mr. Vijay Kosana", "Mrs.Dharani Shruthi Akoju", "Mr.Rakesh Gondlyala", "Mr.D.V.S.R.Subrahmanyam"]
    
    var positions = ["President", "General Secretary", "Vice President", "Vice President", "Treasurer", "Joint Secretary", "Joint Secretary", "Joint Treasurer", "Executive Committee Member", "Executive Committee Member", "Executive Committee Member", "Executive Committee Member", "Executive Committee Member", "Executive Committee Member"]
    
    var mobiles = ["0212663666", "0220491003", "0212511454", "02102604222", "02102468855", "xxx", "xxx", "02102399325", "0220372376", "0211262640", "021739943", "02102923569", "0211558543", "0211899494"]
    
    var emails = ["nztapresident@gmail.com", "generalsecretarynzta@gmail.com", "arunrao.p@gmail.com", "rajjugangishetty@gmail.com", "rrpatllola@gmail.com", "xxx", "xxx", "xxx", "aravind.bathula@gmail.com", "asalvaji@yahoo.com", "vijaykosana@gmail.com", "sruthiakoju@hotmail.com", "rakesh.gon@hotmail.com", "subbu.desu@gmail.com"]
    
    var pageImages = ["president", "ramana-salvaji", "arun", "rajeswri", "raj", "narsing", "srinivas", "santhan-redddy", "Aravind-Reddy", "aruna", "vijaykosna", "sruti", "Rakesh-Gondlyala", "subrahamanyam"]
    
    var bgColors = ["#AC36CA", "#AC36CA", "#C59107", "#C59107", "#C59107", "#C59107", "#C59107", "#C59107", "#0671B5", "#0671B5", "#0671B5", "#0671B5", "#0671B5", "#0671B5"]
    //var bgColors = ["#AC36CA", "#C59107", "#0671B5", "#AC36CA", "#C59107", "#0671B5", "#AC36CA", "#C59107"]
    
    
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
        if index == NSNotFound || index < 0 || index >= names.count {
            return nil
        }
        // Create a new view controller and pass suitable data.
        if let pageContentViewController =
            storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContentViewController")
                as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.position = positions[index]
            pageContentViewController.name = names[index]
            pageContentViewController.mobile = "M. \(mobiles[index])"
            pageContentViewController.email = emails[index]
            pageContentViewController.bgColor = bgColors[index]
            pageContentViewController.index = index
            
            if( index == (names.count - 1) ){
                pageContentViewController.lastImage = "yes"
            }
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
