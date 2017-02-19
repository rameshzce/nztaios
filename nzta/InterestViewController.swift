//
//  InterestViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 13/09/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class InterestViewController: UIViewController {
    let prefs = UserDefaults.standard
    
    
    var events:[(name: String, address: String)] = [
        ("Calender Inauguration", "Rangoli competition & kite festival on 17-1-2016"),
        ("Sankranthi", "Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner "),
        ("Republic Day", "War memorial hall, Mount eden on 1-6-2016 Friday 6.00pm, all are welcome and followed by dinner."),
        ("Blood Donations", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed. Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed"),
        ("Holy Funday", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner."),
        ("Ugadi", "Rangoli competition & kite festival on 17-1-2016"),
        ("Independence Day", "Event at epsom on 1-3-2016 Saturday at 6.00pm, all are welcome and followed by dinner "),
        ("Vinayaka Chaviti", "War memorial hall, Mount eden on 1-6-2016 Friday 6.00pm, all are welcome and followed by dinner."),
        ("Batukamma", "Diwali stall opens at 2 Pm at queens street. reworks and programs starts at 7 Pm. The next day we have diwali celabrations at avondale. children participating Dances and some programs. please participate and enjoy the celebrations at 7.00 PM. Followed"),
        ("Dasara & Diwali", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner."),
        ("Vanabojanalu", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner."),
        ("Xmas", "War memorial hall, Mount eden, on 01-06-16 friday, 6.00 pm, all are welcome and followed by dinner.")
    ]
    
    // MARK: - Public API
    //var interest: Interest! = Interest.createInterests()[0]
    
    // MARK: - Private
    @IBOutlet weak var tableView: UITableView!
    fileprivate let tableHeaderHeight: CGFloat = 350.0
    fileprivate let tableHeaderCutAway: CGFloat = 50.0
    
    fileprivate var headerView: InterestHeaderView!
    fileprivate var headerMaskLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var imageName = "img_calender_inauguration"
        
        
        if prefs.string(forKey: "eventName") != nil{
            self.title = prefs.string(forKey: "eventName")
            
            if (prefs.string(forKey: "eventName") == "Calender Inauguration"){
                imageName = "img_calender_inauguration"
            } else if (prefs.string(forKey: "eventName") == "Sankranthi"){
                imageName = "img_sankranti"
            } else if (prefs.string(forKey: "eventName") == "Republic Day"){
                imageName = "img_republic_day"
            } else if (prefs.string(forKey: "eventName") == "Blood Donations"){
                imageName = "img_blood_donations"
            } else if (prefs.string(forKey: "eventName") == "Holi Funday"){
                imageName = "img_holi"
            } else if (prefs.string(forKey: "eventName") == "Ugadi"){
                imageName = "img_ugadi"
            } else if (prefs.string(forKey: "eventName") == "Independence Day"){
                imageName = "img_independenceday"
            } else if (prefs.string(forKey: "eventName") == "Vinayaka Chaviti"){
                imageName = "img_vinayakachaturdi"
            } else if (prefs.string(forKey: "eventName") == "Batukamma"){
                imageName = "img_batukamma"
            } else if (prefs.string(forKey: "eventName") == "Dasara & Diwali"){
                imageName = "img_dasara_diwali"
            } else if (prefs.string(forKey: "eventName") == "Vanabojanalu"){
                imageName = "img_vanabojanalu"
            } else if (prefs.string(forKey: "eventName") == "Xmas"){
                imageName = "img_xmas"
            } else if (prefs.string(forKey: "eventName") == "Helping Hands"){
                imageName = "img_helping_hands"
            }
            
        }
        
        if (prefs.string(forKey: "menuType") == "Helping Hands"){
            //self.title = prefs.stringForKey("menuType")
        }
        
        
        headerView = tableView.tableHeaderView as! InterestHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        
        tableView.estimatedRowHeight = 300.0
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.backgroundColor = Helper.hexStringToUIColor("#FFFFFF")
        headerView.backgroundImageView.image = UIImage(named: imageName)
        
        updateHeaderView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateHeaderView()
    }
    
    func updateHeaderView()
    {
        let effectiveHeight = tableHeaderHeight - tableHeaderCutAway / 2
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + tableHeaderCutAway/2
        }
        
        headerView.frame = headerRect
        
        // cut away
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y: headerRect.height - tableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
        
    }
    
}



extension InterestViewController : UITableViewDataSource
{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! InterestViewCell
        
        cell.photoGalleryBtn.tag = indexPath.row
        cell.photoGalleryBtn.addTarget(self, action: #selector(InterestViewController.logAction), for: .touchUpInside)
        
        cell.videoGalleryBtn.tag = indexPath.row
        cell.videoGalleryBtn.addTarget(self, action: #selector(InterestViewController.logAction2), for: .touchUpInside)
        
        cell.selectionStyle = .none
        
        cell.interestText.text = "Namasthe ...\n\n New Zealand Telugu Association specially invites you with family and friends to be part of auspicious\n\n \"VINAYAKA CHATURTHI POOJA\"\n\n for all the best days of our lives, For every miracle of waking up each morning, we want to express how grateful we are to the Lord.\n\n Day:  Monday, 5th of September 2016.\n\n Time: 6.30pm\n\n Venue:  Three kings Fickling Convention enter \n\n 546, Mt Albert Road,\n Three Kings.\n Followed by Bhajans and Maha Prasadam.\n\n Main Sponsor :\n\n Smt&Sri Sunitha-Vijay Kosna and family\n\n Maha Prasadam by :\n Satya South Indian Restaurant\n\n Please join us and get the blessings of \"Lord Ganesh\". We are sure the day will inspire you for creativity and motivate you for auspicious beginnings.\n\n See you all on Monday.\n\n ... Executive Committee New Zealand \n Telugu Association"
        
        //cell.backgroundColor = Helper.hexStringToUIColor("#FFDFF0")
        
        cell.interestTitle.text = prefs.string(forKey: "eventName")
        
        if (prefs.string(forKey: "menuType") == "Helping Hands"){
            //cell.interestTitle.text = prefs.stringForKey("menuType")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension;
        
    }
    
    @IBAction func logAction(_ sender: UIButton) {
        let event = self.events[sender.tag]
        
        let eventName = "\(event.name)"
        
        self.prefs.setValue(eventName, forKey: "photoGallery")
        
        
        /*let alertController = UIAlertController(title: "NZTA",
         message: eventName, preferredStyle: UIAlertControllerStyle.Alert)
         alertController.addAction(UIAlertAction(title: "OK", style:
         UIAlertActionStyle.Default, handler: nil))
         self.presentViewController(alertController, animated: true, completion:
         nil)*/
        
        //let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [eventName], applicationActivities: nil)
        
        //self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func logAction2(_ sender: UIButton) {
        let event = self.events[sender.tag]
        
        let eventName = "\(event.name)"
        
        self.prefs.setValue(eventName, forKey: "videoGallery")
        
        /*let alertController = UIAlertController(title: "NZTA",
         message: eventName, preferredStyle: UIAlertControllerStyle.Alert)
         alertController.addAction(UIAlertAction(title: "OK", style:
         UIAlertActionStyle.Default, handler: nil))
         self.presentViewController(alertController, animated: true, completion:
         nil)*/
        
        //let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [eventName], applicationActivities: nil)
        
        //self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
}

extension InterestViewController : UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        updateHeaderView()
        
        // CHALLENGE: - Add code to show/hide "Pull down to close"
    }
}

