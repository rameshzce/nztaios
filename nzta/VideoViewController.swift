//
//  VideoViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 25/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoViewController: UITableViewController, AVPlayerViewControllerDelegate {

    var eventName: String!
    
    let images = ["event_name_image1", "event_name_image2", "event_name_image3", "event_name_image4", "event_name_image5", "event_name_image6", "event_name_image7", "event_name_image8", "event_name_image9", "event_name_image10", "event_name_image11"]
    
    let thumbs = ["thumb_event_name_image1", "thumb_event_name_image2", "thumb_event_name_image3", "thumb_event_name_image4", "thumb_event_name_image5", "thumb_event_name_image6", "thumb_event_name_image7", "thumb_event_name_image8", "thumb_event_name_image9", "thumb_event_name_image10", "thumb_event_name_image11"]
    
    // url for playing video
    var videoUrl: URL!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seguePlayVideo1" {
            
            // get destination view controller
            let destVc = segue.destination as! AVPlayerViewController
            
            // set player
            destVc.player = AVPlayer(url: self.videoUrl)
        }
        
    }
    
    let prefs = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        if prefs.string(forKey: "videoGallery") != nil{
            self.title = prefs.string(forKey: "videoGallery")
        }
        self.title = prefs.string(forKey: "eventName")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return images.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VideoViewCell
        
        
        
        cell.postImageView.image = UIImage(named: thumbs[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.videoUrl = URL(string: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8")
        
        // perform segue
        self.performSegue(withIdentifier: "seguePlayVideo1", sender: self)
    }
    
}
