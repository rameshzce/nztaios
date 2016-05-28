//
//  PlayVideoViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 28/05/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class PlayVideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let path: String = NSBundle.mainBundle().pathForResource("video1", ofType: "mp4")!
        let movieUrl: NSURL = NSURL.fileURLWithPath(path)
        let movie: AVPlayerViewController = AVPlayerViewController()
        movie.view.frame = self.view.bounds
        
        let player: AVPlayer = AVPlayer(URL: movieUrl)
        movie.player = player
        
        self.view.addSubview(movie.view)
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
